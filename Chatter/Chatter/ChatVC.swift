//
//  ChatVC.swift
//  Chatter
//
//  Created by Artur Azarov on 08.09.17.
//  Copyright © 2017 Artur Azarov. All rights reserved.
//

import Cocoa

class ChatVC: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = CGColor.white
    }
    
}
