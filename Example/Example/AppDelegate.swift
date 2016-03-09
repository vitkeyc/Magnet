//
//  AppDelegate.swift
//  Example
//
//  Created by 古林俊佑 on 2016/03/09.
//  Copyright © 2016年 Shunsuke Furubayashi. All rights reserved.
//

import Cocoa
import Magnet

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    private var hotKey: HotKey?

    func applicationDidFinishLaunching(aNotification: NSNotification) {

        // ⌘ + Control + B
        let keyCombo = KeyCombo(keyCode: 11, modifiers: 4352)
        hotKey = HotKey(identifier: "CommandControlB",
                        keyCombo: keyCombo,
                        target: self,
                        action: #selector(AppDelegate.hotkey))
        HotKeyCenter.sharedCenter.register(hotKey!)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        HotKeyCenter.sharedCenter.unregister(hotKey!)
    }

    func hotkey() {
        print("hotKey!!!!")
    }
}

