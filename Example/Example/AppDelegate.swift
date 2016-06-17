//
//  AppDelegate.swift
//  Example
//
//  Created by 古林俊佑 on 2016/03/09.
//  Copyright © 2016年 Shunsuke Furubayashi. All rights reserved.
//

import Cocoa
import Magnet
import Carbon

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    private var hotKey: HotKey?
    private var hotKey2: HotKey?
    private var hotKey3: HotKey?
    private var hotKey4: HotKey?
    private var hotKey5: HotKey?

    func applicationDidFinishLaunching(aNotification: NSNotification) {

        // ⌘ + Control + B
        guard let keyCombo = KeyCombo(keyCode: 11, carbonModifiers: 4352) else { return }
        //let keyCombo = KeyCombo(keyCode: 11, modifiers: 4352)
        hotKey = HotKey(identifier: "CommandControlB",
                        keyCombo: keyCombo,
                        target: self,
                        action: #selector(AppDelegate.tappedHotKey))
        hotKey?.register()

        guard let keyCombo2 = KeyCombo(doubledModifiers: .CommandKeyMask) else { return }
        hotKey2 = HotKey(identifier: "CommandDobuleTap",
                         keyCombo: keyCombo2,
                         target: self,
                         action: #selector(AppDelegate.tappedDoubleCommandKey))
        hotKey2?.register()

        guard let keyCombo3 = KeyCombo(doubledModifiers: .ShiftKeyMask) else { return }
        hotKey3 = HotKey(identifier: "ShiftDobuleTap",
                         keyCombo: keyCombo3,
                         target: self,
                         action: #selector(AppDelegate.tappedDoubleShiftKey))
        hotKey3?.register()

        guard let keyCombo4 = KeyCombo(doubledModifiers: .ControlKeyMask) else { return }
        hotKey4 = HotKey(identifier: "ControlDobuleTap",
                         keyCombo: keyCombo4,
                         target: self,
                         action: #selector(AppDelegate.tappedDoubleControlKey))
        hotKey4?.register()

        guard let keyCombo5 = KeyCombo(doubledModifiers: .AlternateKeyMask) else { return }
        hotKey5 = HotKey(identifier: "AltDobuleTap",
                         keyCombo: keyCombo5,
                         target: self,
                         action: #selector(AppDelegate.tappedDoubleAltKey))
        hotKey5?.register()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        hotKey?.unregister()
        hotKey2?.unregister()
        hotKey3?.unregister()
        hotKey4?.unregister()
        hotKey5?.unregister()
    }

    func tappedHotKey() {
        print("hotKey!!!!")
    }

    func tappedDoubleCommandKey() {
        print("command double tapped!!!")
    }

    func tappedDoubleShiftKey() {
        print("shift double tapped!!!")
    }

    func tappedDoubleControlKey() {
        print("control double tapped!!!")
    }

    func tappedDoubleAltKey() {
        print("alt double tapped!!!")
    }
}

