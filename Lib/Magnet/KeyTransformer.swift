//
//  KeyTransformer.swift
//  Magnet
//
//  Created by 古林俊佑 on 2016/06/18.
//  Copyright © 2016年 Shunsuke Furubayashi. All rights reserved.
//

import Cocoa
import Carbon

public final class KeyTransformer {}

// MARK: - Cocoa & Carbon
public extension KeyTransformer {
    public static func carbonToCocoaFlags(carbonFlags: Int) -> NSEventModifierFlags {
        var cocoaFlags: NSEventModifierFlags = NSEventModifierFlags(rawValue: 0)

        if (carbonFlags & cmdKey) != 0 {
            cocoaFlags.insert(.CommandKeyMask)
        }
        if (carbonFlags & optionKey) != 0 {
            cocoaFlags.insert(.AlternateKeyMask)
        }
        if (carbonFlags & controlKey) != 0 {
            cocoaFlags.insert(.ControlKeyMask)
        }
        if (carbonFlags & shiftKey) != 0 {
            cocoaFlags.insert(.ShiftKeyMask)
        }

        return cocoaFlags
    }

    public static func cocoaToCarbonFlags(cocoaFlags: NSEventModifierFlags) -> Int {
        var carbonFlags: Int = 0

        if cocoaFlags.contains(.CommandKeyMask) {
            carbonFlags |= cmdKey
        }
        if cocoaFlags.contains(.AlternateKeyMask) {
            carbonFlags |= optionKey
        }
        if cocoaFlags.contains(.ControlKeyMask) {
            carbonFlags |= controlKey
        }
        if cocoaFlags.contains(.ShiftKeyMask) {
            carbonFlags |= shiftKey
        }

        return carbonFlags
    }

    public static func supportedCarbonFlags(carbonFlags: Int) -> Bool {
        return carbonToCocoaFlags(carbonFlags).rawValue != 0
    }

    public static func supportedCocoaFlags(cocoaFlogs: NSEventModifierFlags) -> Bool {
        return cocoaToCarbonFlags(cocoaFlogs) != 0
    }

    public static func singleCarbonFlags(carbonFlags: Int) -> Bool {
        let commandSelected = (carbonFlags & cmdKey) != 0
        let altSelected     = (carbonFlags & optionKey) != 0
        let controlSelected = (carbonFlags & controlKey) != 0
        let shiftSelected   = (carbonFlags & shiftKey) != 0
        let hash = commandSelected.hashValue + altSelected.hashValue + controlSelected.hashValue + shiftSelected.hashValue
        return hash == 1
    }

    public static func singleCocoaFlags(cocoaFlags: NSEventModifierFlags) -> Bool {
        let commandSelected = cocoaFlags.contains(.CommandKeyMask)
        let altSelected     = cocoaFlags.contains(.AlternateKeyMask)
        let controlSelected = cocoaFlags.contains(.ControlKeyMask)
        let shiftSelected   = cocoaFlags.contains(.ShiftKeyMask)
        let hash = commandSelected.hashValue + altSelected.hashValue + controlSelected.hashValue + shiftSelected.hashValue
        return hash == 1
    }
}

// MARK: - Function
public extension KeyTransformer {
    public static func containsFunctionKey(keyCode: Int) -> Bool {
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
            return true
        default:
            return false
        }
    }
}

// MARK: - Modifiers
public extension KeyTransformer {
    public static func modifiersToString(carbonModifiers: Int) -> [String] {
        var strings = [String]()

        if (carbonModifiers & cmdKey) != 0 {
            strings.append("⌘")
        }
        if (carbonModifiers & optionKey) != 0 {
            strings.append("⌥")
        }
        if (carbonModifiers & controlKey) != 0 {
            strings.append("⌃")
        }
        if (carbonModifiers & shiftKey) != 0 {
            strings.append("⇧")
        }

        return strings
    }

    public static func modifiersToString(cocoaModifiers: NSEventModifierFlags) -> [String] {
        var strings = [String]()

        if cocoaModifiers.contains(.CommandKeyMask) {
            strings.append("⌘")
        }
        if cocoaModifiers.contains(.AlternateKeyMask) {
            strings.append("⌥")
        }
        if cocoaModifiers.contains(.ControlKeyMask) {
            strings.append("⌃")
        }
        if cocoaModifiers.contains(.ShiftKeyMask) {
            strings.append("⇧")
        }

        return strings
    }
}

// MARK: - KyeCode
public extension KeyTransformer {
    public static func keyCodeToString(keyCode: Int) -> String {
        switch keyCode {
        case 0:
            return "A"
        case 1:
            return "S"
        case 2:
            return "D"
        case 3:
            return "F"
        case 4:
            return "H"
        case 5:
            return "G"
        case 6:
            return "Z"
        case 7:
            return "X"
        case 8:
            return "C"
        case 9:
            return "V"
        case 10:
            return "$"
        case 11:
            return "B"
        case 12:
            return "Q"
        case 13:
            return "W"
        case 14:
            return "E"
        case 15:
            return "R"
        case 16:
            return "Y"
        case 17:
            return "T"
        case 18:
            return "1"
        case 19:
            return "2"
        case 20:
            return "3"
        case 21:
            return "4"
        case 22:
            return "6"
        case 23:
            return "5"
        case 24:
            return "="
        case 25:
            return "9"
        case 26:
            return "7"
        case 27:
            return "-"
        case 28:
            return "8"
        case 29:
            return "0"
        case 30:
            return "]"
        case 31:
            return "O"
        case 32:
            return "U"
        case 33:
            return "["
        case 34:
            return "I"
        case 35:
            return "P"
        case 36:
            return "Return"
        case 37:
            return "L"
        case 38:
            return "J"
        case 39:
            return "'"
        case 40:
            return "K"
        case 41:
            return ";"
        case 42:
            return "\\"
        case 43:
            return ","
        case 44:
            return "/"
        case 45:
            return "N"
        case 46:
            return "M"
        case 47:
            return "."
        case 48:
            return "Tab"
        case 49:
            return "Space"
        case 50:
            return "`"
        case 51:
            return "Delete"
        case 53:
            return "ESC"
        case 55:
            return "Command"
        case 56:
            return "Shift"
        case 57:
            return "Caps Lock"
        case 58:
            return "Option"
        case 59:
            return "Control"
        case 65:
            return "Pad ."
        case 67:
            return "Pad *"
        case 69:
            return "Pad +"
        case 71:
            return "Clear"
        case 75:
            return "Pad /"
        case 76:
            return "Pad Enter"
        case 78:
            return "Pad -"
        case 81:
            return "Pad ="
        case 82:
            return "Pad 0"
        case 83:
            return "Pad 1"
        case 84:
            return "Pad 2"
        case 85:
            return "Pad 3"
        case 86:
            return "Pad 4"
        case 87:
            return "Pad 5"
        case 88:
            return "Pad 6"
        case 89:
            return "Pad 7"
        case 91:
            return "Pad 8"
        case 92:
            return "Pad 9"
        case 96:
            return "F5"
        case 97:
            return "F6"
        case 98:
            return "F7"
        case 99:
            return "F3"
        case 100:
            return "F8"
        case 101:
            return "F9"
        case 103:
            return "F11"
        case 105:
            return "F13"
        case 107:
            return "F14"
        case 109:
            return "F10"
        case 111:
            return "F12"
        case 113:
            return "F15"
        case 114:
            return "Ins"
        case 115:
            return "Home"
        case 116:
            return "Page Up"
        case 117:
            return "Del"
        case 118:
            return "F4"
        case 119:
            return "End"
        case 120:
            return "F2"
        case 121:
            return "Page Down"
        case 122:
            return "F1"
        case 123:
            return "Left Arrow"
        case 124:
            return "Right Arrow"
        case 125:
            return "Down Arrow"
        case 126:
            return "Up Arrow"
        default:
            return ""
        }
    }
}
