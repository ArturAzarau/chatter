//
//  Extensions.swift
//  Chatter
//
//  Created by Artur Azarov on 08.09.17.
//  Copyright © 2017 Artur Azarov. All rights reserved.
//

import Cocoa

extension NSColor {
    public class var chatPurple: NSColor {
        return NSColor(calibratedRed: 0.3, green: 0.22, blue: 0.29, alpha: 1)
    }
    
    public class var chatGreen: NSColor {
        return NSColor(calibratedRed: 0.22, green: 0.66, blue: 0.68, alpha: 1)
    }
}

extension NSButton {
    func styleButtonText(button: NSButton, buttonName: String, fontColor: NSColor, alignment: NSTextAlignment, font: String, size: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        button.attributedTitle = NSAttributedString(string: buttonName, attributes:
            [NSAttributedStringKey.foregroundColor: fontColor, NSAttributedStringKey.paragraphStyle: paragraphStyle, NSAttributedStringKey.font: NSFont(name: font, size: size)!])
    }
}
