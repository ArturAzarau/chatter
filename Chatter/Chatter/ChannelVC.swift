//
//  ChannelVC.swift
//  Chatter
//
//  Created by Artur Azarov on 08.09.17.
//  Copyright © 2017 Artur Azarov. All rights reserved.
//

import Cocoa

final class ChannelVC: NSViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var userNameLabel: NSTextField!
    @IBOutlet weak var addChannelButton: NSButton!
    @IBOutlet weak var tableView: NSScrollView!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        setUpView()
    }
    
    // MARK: - View methods
    
    private func setUpView() {
        
        // setup main view
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.chatPurple.cgColor
        
        // setup add button
        
        addChannelButton.styleButtonText(button: addChannelButton, buttonName: "Add +", fontColor: .controlColor, alignment: .center, font: Fonts.avenirRegular, size: 13)
    }
    
    // MARK: - Actions
    
    @IBAction func addChannelClicked(_ sender: NSButton) {
    }
    
}
