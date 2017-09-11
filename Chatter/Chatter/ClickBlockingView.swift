//
//  ClickBlockingView.swift
//  Chatter
//
//  Created by Artur Azarov on 09.09.17.
//  Copyright © 2017 Artur Azarov. All rights reserved.
//

import Cocoa

final class ClickBlockingView: NSView {
    override func mouseUp(with event: NSEvent) {}
    override func mouseDown(with event: NSEvent) {}
    override func mouseDragged(with event: NSEvent) {}
    override func mouseMoved(with event: NSEvent) {}
}
