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

    // MARK: - Initialize
    public init?(keyCode: Int, carbonModifiers: Int) {
        if keyCode < 0 || carbonModifiers < 0 { return nil }

        if KeyTransformer.containsFunctionKey(keyCode) {
            self.modifiers = Int(UInt(carbonModifiers) | NSEventModifierFlags.FunctionKeyMask.rawValue)
        } else {
            self.modifiers = carbonModifiers
        }
        self.keyCode = keyCode
        self.doubledModifiers = false
    }

    public init?(keyCode: Int, cocoaModifiers: NSEventModifierFlags) {
        if keyCode < 0 || !KeyTransformer.supportedCocoaFlags(cocoaModifiers) { return nil }

        if KeyTransformer.containsFunctionKey(keyCode) {
            self.modifiers = Int(UInt(KeyTransformer.cocoaToCarbonFlags(cocoaModifiers)) | NSEventModifierFlags.FunctionKeyMask.rawValue)
        } else {
            self.modifiers = KeyTransformer.cocoaToCarbonFlags(cocoaModifiers)
        }
        self.keyCode = keyCode
        self.doubledModifiers = false
    }

    public init?(doubledModifiers modifiers: Int) {
        if !KeyTransformer.singleCarbonFlags(modifiers) { return nil }

        self.keyCode = 0
        self.modifiers = modifiers
        self.doubledModifiers = true
    }

    public init?(doubledModifiers modifiers: NSEventModifierFlags) {
        if !KeyTransformer.singleCocoaFlags(modifiers) { return nil }

        self.keyCode = 0
        self.modifiers = KeyTransformer.cocoaToCarbonFlags(modifiers)
        self.doubledModifiers = true
    }

    @objc public func copyWithZone(zone: NSZone) -> AnyObject {
        if doubledModifiers {
            return KeyCombo(doubledModifiers: modifiers)!
        } else {
            return KeyCombo(keyCode: keyCode, carbonModifiers: modifiers)!
        }
    }
}

// MARK: - Equatable
public func ==(lhs: KeyCombo, rhs: KeyCombo) -> Bool {
    return lhs.keyCode == rhs.keyCode && lhs.modifiers == rhs.modifiers && lhs.doubledModifiers == rhs.doubledModifiers
}
