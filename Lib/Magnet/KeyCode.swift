//
//  KeyCode.swift
//  Magnet
//
//  Created by 古林俊佑 on 2016/06/20.
//  Copyright © 2016年 Shunsuke Furubayashi. All rights reserved.
//

import Foundation

public enum KeyCode: Int {
    case A = 0
    case S = 1
    case D = 2
    case F = 3
    case H = 4
    case G = 5
    case Z = 6
    case X = 7
    case C = 8
    case V = 9
    case $ = 10
    case B = 11
    case Q = 12
    case W = 13
    case E = 14
    case R = 15
    case Y = 16
    case T = 17
    case One = 18
    case Two = 19
    case Three = 20
    case Four = 21
    case Six = 22
    case Five = 23
    case Equal = 24
    case Nine = 25
    case Seven = 26
    case Hyphen = 27
    case Eight = 28
    case Zero = 29
    case RightSquareBracket = 30
    case O = 31
    case U = 32
    case LeftSquareBracket = 33
    case I = 34
    case P = 35
    case Return = 36
    case L = 37
    case J = 38
    case SingleQuote = 39
    case K = 40
    case Semicolon = 41
    case BackSlash = 42
    case Comma = 43
    case Slash = 44
    case N = 45
    case M = 46
    case Period = 47
    case Tab = 48
    case Space = 49
    case BackQuotes = 50
    case Delete = 51
    case ESC = 53
    case Command = 55
    case Shift = 56
    case Capslock = 57
    case Option = 58
    case Control = 59
    case PadPeriod = 65
    case PadAsterisk = 67
    case PadPlus = 69
    case Clear = 71
    case PadSlash = 75
    case PadEnter = 76
    case PadHyphen = 78
    case PadEqual = 81
    case PadZero = 82
    case PadOne = 83
    case PadTwo = 84
    case PadThree = 85
    case PadFour = 86
    case PadFive = 87
    case PadSix = 88
    case PadSeven = 89
    case PadEight = 91
    case PadNine = 92
    case F5 = 96
    case F6 = 97
    case F7 = 98
    case F3 = 99
    case F8 = 100
    case F9 = 101
    case F11 = 103
    case F13 = 105
    case F14 = 107
    case F10 = 109
    case F12 = 111
    case F15 = 113
    case Insert = 114
    case Home = 115
    case PageUp = 116
    case Del = 117
    case F4 = 118
    case End = 119
    case F2 = 120
    case PageDown = 121
    case F1 = 122
    case LeftArrow = 123
    case RightArrow = 124
    case DownArrow = 125
    case UpArrow = 126

    public var stringValue: String {
        switch self {
        case .A:
            return "A"
        case .S:
            return "S"
        case .D:
            return "D"
        case .F:
            return "F"
        case .H:
            return "H"
        case .G:
            return "G"
        case .Z:
            return "Z"
        case .X:
            return "X"
        case .C:
            return "C"
        case .V:
            return "V"
        case .$:
            return "$"
        case .B:
            return "B"
        case .Q:
            return "Q"
        case .W:
            return "W"
        case .E:
            return "E"
        case .R:
            return "R"
        case .Y:
            return "Y"
        case .T:
            return "T"
        case .One:
            return "1"
        case .Two:
            return "2"
        case .Three:
            return "3"
        case .Four:
            return "4"
        case .Six:
            return "6"
        case .Five:
            return "5"
        case .Equal:
            return "="
        case .Nine:
            return "9"
        case .Seven:
            return "7"
        case .Hyphen:
            return "-"
        case .Eight:
            return "8"
        case .Zero:
            return "0"
        case .RightSquareBracket:
            return "]"
        case .O:
            return "O"
        case .U:
            return "U"
        case .LeftSquareBracket:
            return "["
        case .I:
            return "I"
        case .P:
            return "P"
        case .Return:
            return "Return"
        case .L:
            return "L"
        case .J:
            return "J"
        case .SingleQuote:
            return "'"
        case .K:
            return "K"
        case .Semicolon:
            return ";"
        case .BackSlash:
            return "\\"
        case .Comma:
            return ","
        case .Slash:
            return "/"
        case .N:
            return "N"
        case .M:
            return "M"
        case .Period:
            return "."
        case .Tab:
            return "Tab"
        case .Space:
            return "Space"
        case .BackQuotes:
            return "`"
        case .Delete:
            return "Delete"
        case .ESC:
            return "ESC"
        case .Command:
            return "Command"
        case .Shift:
            return "Shift"
        case .Capslock:
            return "Caps Lock"
        case .Option:
            return "Option"
        case .Control:
            return "Control"
        case .PadPeriod:
            return "Pad ."
        case .PadAsterisk:
            return "Pad *"
        case .PadPlus:
            return "Pad +"
        case .Clear:
            return "Claer"
        case .PadSlash:
            return "Pad /"
        case .PadEnter:
            return "Pad Enter"
        case .PadHyphen:
            return "Pad -"
        case .PadEqual:
            return "Pad ="
        case .PadZero:
            return "Pad 0"
        case .PadOne:
            return "Pad 1"
        case .PadTwo:
            return "Pad 2"
        case .PadThree:
            return "Pad 3"
        case .PadFour:
            return "Pad 4"
        case .PadFive:
            return "Pad 5"
        case .PadSix:
            return "Pad 6"
        case .PadSeven:
            return "Pad 7"
        case .PadEight:
            return "Pad 8"
        case .PadNine:
            return "Pad 9"
        case .F5:
            return "F5"
        case .F6:
            return "F6"
        case .F7:
            return "F7"
        case .F3:
            return "F3"
        case .F8:
            return "F8"
        case .F9:
            return "F9"
        case .F11:
            return "F11"
        case .F13:
            return "F13"
        case .F14:
            return "F14"
        case .F10:
            return "F10"
        case .F12:
            return "F12"
        case .F15:
            return "F15"
        case .Insert:
            return "Insert"
        case .Home:
            return "Home"
        case .PageUp:
            return "Page Up"
        case .Del:
            return "Del"
        case .F4:
            return "F4"
        case .End:
            return "End"
        case .F2:
            return "F2"
        case .PageDown:
            return "Page Down"
        case .F1:
            return "F1"
        case .LeftArrow:
            return "Left Arrow"
        case .RightArrow:
            return "Right Arrow"
        case .DownArrow:
            return "Down Arrow"
        case .UpArrow:
            return "Up Arrow"
        }
    }
}
