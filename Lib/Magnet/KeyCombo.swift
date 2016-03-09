//
//  KeyCombo.swift
//  Magnet
//
//  Created by 古林俊佑 on 2016/03/09.
//  Copyright © 2016年 Shunsuke Furubayashi. All rights reserved.
//

import Cocoa
import Carbon

public final class KeyCombo: NSCopying, Equatable {

    // MARK: - Properties
    public let keyCode: Int
    public let modifiers: Int
    
    public var plist: [String: AnyObject] {
        return ["keyCode": keyCode, "modifiers": modifiers]
    }
    public var isValidHotKeyCombo: Bool {
        return keyCode >= 0 && modifiers > 0
    }
    public var isClearCombo: Bool {
        return keyCode == -1 && modifiers == -1
    }
    
    // MARK: - Initialize
    public init(keyCode: Int, modifiers: Int) {
        switch keyCode {
        case kVK_F1: fallthrough
        case kVK_F2: fallthrough
        case kVK_F3: fallthrough
        case kVK_F4: fallthrough
        case kVK_F5: fallthrough
        case kVK_F6: fallthrough
        case kVK_F7: fallthrough
        case kVK_F8: fallthrough
        case kVK_F9: fallthrough
        case kVK_F10: fallthrough
        case kVK_F11: fallthrough
        case kVK_F12: fallthrough
        case kVK_F13: fallthrough
        case kVK_F14: fallthrough
        case kVK_F15: fallthrough
        case kVK_F16: fallthrough
        case kVK_F17: fallthrough
        case kVK_F18: fallthrough
        case kVK_F19: fallthrough
        case kVK_F20:
            self.modifiers = Int(UInt(modifiers) | NSEventModifierFlags.FunctionKeyMask.rawValue)
        default:
            self.modifiers = modifiers
        }
        self.keyCode = keyCode
    }
    
    public init(plist: [String: AnyObject]) {
        if plist.isEmpty {
            self.keyCode = -1
            self.modifiers = -1
        } else {
            let keyCode = plist["keyCode"] as? Int ?? -1
            let modifiers = plist["modifiers"] as? Int ?? -1
            self.keyCode = (keyCode < 0) ? -1 : keyCode
            self.modifiers = (modifiers <= 0) ? -1 : modifiers
        }
    }
    
    @objc public func copyWithZone(zone: NSZone) -> AnyObject {
        return KeyCombo(keyCode: keyCode, modifiers: modifiers)
    }
}

// MARK: - Static Methods
public extension KeyCombo {
    static func clearKeyCombo() -> KeyCombo {
        return keyCombo(-1, modifiers: -1)
    }
    
    static func keyCombo(keyCode: Int, modifiers: Int) -> KeyCombo {
        return KeyCombo(keyCode: keyCode, modifiers: modifiers)
    }
}

// MARK: - Equatable
public func ==(lhs: KeyCombo, rhs: KeyCombo) -> Bool {
    return lhs.keyCode == rhs.keyCode && lhs.modifiers == rhs.modifiers
}
