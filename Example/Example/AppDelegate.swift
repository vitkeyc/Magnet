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

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // ⌘ + Control + B
        guard let keyCombo = KeyCombo(keyCode: 11, carbonModifiers: 4352) else { return }
        let hotKey = HotKey(identifier: "CommandControlB",
                        keyCombo: keyCombo,
                        target: self,
                        action: #selector(AppDelegate.tappedHotKey))
        hotKey.register()

        // Shift + Control + A
        guard let keyCombo2 = KeyCombo(keyCode: .A, cocoaModifiers: [.ShiftKeyMask, .ControlKeyMask]) else { return }
        let hotKey2 = HotKey(identifier: "ShiftControlA",
                             keyCombo: keyCombo2,
                             target: self,
                             action: #selector(AppDelegate.tappedHotKey2))
        hotKey2.register()

        //　⌘　Double Tap
        guard let keyCombo3 = KeyCombo(doubledCocoaModifiers: .CommandKeyMask) else { return }
        let hotKey3 = HotKey(identifier: "CommandDobuleTap",
                         keyCombo: keyCombo3,
                         target: self,
                         action: #selector(AppDelegate.tappedDoubleCommandKey))
        hotKey3.register()

        //　Shift　Double Tap
        guard let keyCombo4 = KeyCombo(doubledCocoaModifiers: .ShiftKeyMask) else { return }
        let hotKey4 = HotKey(identifier: "ShiftDobuleTap",
                         keyCombo: keyCombo4,
                         target: self,
                         action: #selector(AppDelegate.tappedDoubleShiftKey))
        hotKey4.register()

        //　Control　Double Tap
        guard let keyCombo5 = KeyCombo(doubledCocoaModifiers: .ControlKeyMask) else { return }
        let hotKey5 = HotKey(identifier: "ControlDobuleTap",
                         keyCombo: keyCombo5,
                         target: self,
                         action: #selector(AppDelegate.tappedDoubleControlKey))
        hotKey5.register()

        //　Option　Double Tap
        guard let keyCombo6 = KeyCombo(doubledCocoaModifiers: .AlternateKeyMask) else { return }
        let hotKey6 = HotKey(identifier: "AltDobuleTap",
                         keyCombo: keyCombo6,
                         target: self,
                         action: #selector(AppDelegate.tappedDoubleAltKey))
        hotKey6.register()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        HotKeyCenter.sharedCenter.unregisterAll()
    }

    func tappedHotKey() {
        print("hotKey!!!!")
    }

    func tappedHotKey2() {
        print("hotKey2!!!!")
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

