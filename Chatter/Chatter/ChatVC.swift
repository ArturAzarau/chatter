//
//  ChatVC.swift
//  Chatter
//
//  Created by Artur Azarov on 08.09.17.
//  Copyright © 2017 Artur Azarov. All rights reserved.
//

import Cocoa

final class ChatVC: NSViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var channelTitleLabel: NSTextField!
    @IBOutlet weak var channelDescriptionLabel: NSTextField!
    @IBOutlet weak var tableView: NSScrollView!
    @IBOutlet weak var typingUserLabel: NSTextField!
    @IBOutlet weak var messageOutlineView: NSView!
    @IBOutlet weak var messageTextView: NSTextField!
    @IBOutlet weak var sendMessageButton: NSButton!
    
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
        view.layer?.backgroundColor = CGColor.white
        
        // setup message outline view
        
        messageOutlineView.wantsLayer = true
        messageOutlineView.layer?.backgroundColor = CGColor.white
        messageOutlineView.layer?.borderColor = NSColor.controlHighlightColor.cgColor
        messageOutlineView.layer?.borderWidth = 2
        messageOutlineView.layer?.cornerRadius = 5
        
        // setup send message button
        
        sendMessageButton.styleButtonText(button: sendMessageButton, buttonName: "Send", fontColor: .darkGray, alignment: .center, font: Fonts.avenirRegular, size: 13)
    }
    
    // MARK: - Actions
    
    @IBAction func sendMessageButtonClicked(_ sender: NSButton) {
    }
    
}
