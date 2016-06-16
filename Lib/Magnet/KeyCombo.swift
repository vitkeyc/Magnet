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
    public let doubledModifiers: Bool

    public enum ModifierKey {
        case Command
        case Shift
        case Control
        case Alt
        case None

        var modifier: Int {
            switch self {
            case .Command:
                return cmdKey
            case .Shift:
                return shiftKey
            case .Control:
                return controlKey
            case .Alt:
                return optionKey
            case .None:
                return 0
            }
        }
    }

    // MARK: - Initialize
    public init?(keyCode: Int, modifiers: Int) {
        if keyCode < 0 || modifiers < 0 { return nil }

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
        self.doubledModifiers = false
    }

    public init?(doubledModifiers modifiers: Int) {
        if modifiers != shiftKey &&
            modifiers != controlKey &&
            modifiers != optionKey &&
            modifiers != cmdKey { return nil }

        self.keyCode = 0
        self.modifiers = modifiers
        self.doubledModifiers = true
    }

    public init?(doubledModifiers modifiers: ModifierKey) {
        if modifiers == .None { return nil }

        self.keyCode = 0
        self.modifiers = modifiers.modifier
        self.doubledModifiers = true
    }

    @objc public func copyWithZone(zone: NSZone) -> AnyObject {
        if doubledModifiers {
            return KeyCombo(doubledModifiers: modifiers)!
        } else {
            return KeyCombo(keyCode: keyCode, modifiers: modifiers)!
        }
    }
}

// MARK: - Equatable
public func ==(lhs: KeyCombo, rhs: KeyCombo) -> Bool {
    return lhs.keyCode == rhs.keyCode && lhs.modifiers == rhs.modifiers && lhs.doubledModifiers == rhs.doubledModifiers
}
