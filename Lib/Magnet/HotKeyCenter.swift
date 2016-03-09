//
//  HotKeyCenter.swift
//  Magnet
//
//  Created by 古林俊佑 on 2016/03/09.
//  Copyright © 2016年 Shunsuke Furubayashi. All rights reserved.
//

import Cocoa
import Carbon

public final class HotKeyCenter {

    // MARK: - Properties
    public static let sharedCenter = HotKeyCenter()
    private var hotKeys = [String: HotKey]()
    private var hotKeyMap = [NSNumber: HotKey]()
    private var hotKeyCount: UInt32 = 0

    // MARK: - Initialize
    init() {
        installEventHandler()
    }

}

// MARK: - Register & Unregister
public extension HotKeyCenter {
    public func register(hotKey: HotKey) -> Bool {
        if hotKeys.values.contains(hotKey) { unregister(hotKey) }
        if !hotKey.keyCombo.isValidHotKeyCombo { return false }

        let hotKeyId = EventHotKeyID(signature: UTGetOSTypeFromString("Magnet"), id: hotKeyCount)
        var carbonHotKey: EventHotKeyRef = nil
        let error = RegisterEventHotKey(UInt32(hotKey.keyCombo.keyCode),
                                        UInt32(hotKey.keyCombo.modifiers),
                                        hotKeyId,
                                        GetEventDispatcherTarget(),
                                        0,
                                        &carbonHotKey)
        if error != 0 { return false }

        hotKey.hotKeyId = hotKeyId.id
        hotKey.hotKeyRef = carbonHotKey

        let kId = NSNumber(unsignedInt: hotKeyCount)
        hotKeyMap[kId] = hotKey
        hotKeyCount += 1

        hotKeys[hotKey.identifier] = hotKey

        return true
    }
    
    public func unregister(hotKey: HotKey) {
        if !hotKeys.values.contains(hotKey) { return }
        guard let carbonHotKey = hotKey.hotKeyRef else { return }

        UnregisterEventHotKey(carbonHotKey)
        hotKeys.removeValueForKey(hotKey.identifier)

        hotKey.hotKeyId = nil
        hotKey.hotKeyRef = nil

        hotKeyMap
            .filter { $1 == hotKey }
            .map { $0.0 }
            .forEach { hotKeyMap.removeValueForKey($0) }
    }

    public func unregisterHotKey(identifier: String) {
        guard let hotKey = hotKeys[identifier] else { return }
        unregister(hotKey)
    }

    public func unregisterAll() {
        hotKeys.forEach { unregister($1) }
    }
}

// MARK: - HotKeys
public extension HotKeyCenter {
    public func hotKey(identifier: String) -> HotKey? {
        return hotKeys[identifier]
    }
}

// MARK: - Events
private extension HotKeyCenter {
    private func installEventHandler() {
        var pressedEventType = EventTypeSpec()
        pressedEventType.eventClass = OSType(kEventClassKeyboard)
        pressedEventType.eventKind = OSType(kEventHotKeyPressed)
        InstallEventHandler(GetEventDispatcherTarget(), { (_, inEvent, _) -> OSStatus in
            return HotKeyCenter.sharedCenter.sendCarbonEvent(inEvent)
        }, 1, &pressedEventType, nil, nil)
    }

    private func sendCarbonEvent(event: EventRef) -> OSStatus {
        assert(Int(GetEventClass(event)) == kEventClassKeyboard, "Unknown event class")

        var hotKeyId = EventHotKeyID()
        let error = GetEventParameter(event,
                                      EventParamName(kEventParamDirectObject),
                                      EventParamName(typeEventHotKeyID),
                                      nil,
                                      sizeof(EventHotKeyID),
                                      nil,
                                      &hotKeyId)

        if error != 0 { return error }

        assert(hotKeyId.signature == UTGetOSTypeFromString("Magnet"), "Invalid hot key id")

        let kId = NSNumber(unsignedInt: hotKeyId.id)
        let hotKey = hotKeyMap[kId]

        switch GetEventKind(event) {
        case EventParamName(kEventHotKeyPressed):
            hotKeyDown(hotKey)
        default:
            assert(false, "Unknown event kind")
        }

        return noErr
    }

    private func hotKeyDown(hotKey: HotKey?) {
        guard let hotKey = hotKey else { return }
        hotKey.invoke()
    }
}
