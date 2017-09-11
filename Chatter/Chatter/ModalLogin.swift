//
//  ModalLogin.swift
//  Chatter
//
//  Created by Artur Azarov on 09.09.17.
//  Copyright © 2017 Artur Azarov. All rights reserved.
//

import Cocoa

final class ModalLogin: NSView {

    // MARK: - Constants
    
    private let modalLogin = "ModalLogin"
    
    // MARK: - Outlets
    
    @IBOutlet weak var view: NSView!
    @IBOutlet weak var emailTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSSecureTextField!
    @IBOutlet weak var loginButton: NSButton!
    @IBOutlet weak var createNewAccountButton: NSButton!
    @IBOutlet weak var mainStackView: NSStackView!
    
    // MARK: - Life cycle
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        Bundle.main.loadNibNamed(NSNib.Name.init(modalLogin), owner: self, topLevelObjects: nil)
        addSubview(view)
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        setUpView()
    }
    
    // MARK: - Actions
    
    @IBAction func loginButtonClicked(_ sender: NSButton) {
    }
    @IBAction func createNewAccountButtonClicked(_ sender: NSButton) {
    }
    @IBOutlet weak var closeButtonClicked: NSButton!
    
    // MARK: - View methods
    
    private func setUpView() {
        
        // setup main view
        
        view.frame = NSRect(x: 0, y: 0, width: 475, height: 300)
        view.layer?.backgroundColor = .white
        view.layer?.cornerRadius = 7
        
        // setup login button
        
        loginButton.styleButtonText(button: loginButton, buttonName: "Login", fontColor: .white, alignment: .center, font: Fonts.avenirRegular, size: 14)
        loginButton.layer?.backgroundColor = NSColor.chatGreen.cgColor
        loginButton.layer?.cornerRadius = 7
        
        // setup createAccountButton
        
        createNewAccountButton.styleButtonText(button: createNewAccountButton, buttonName: "Create Account", fontColor: NSColor.chatGreen, alignment: .center, font: Fonts.avenirRegular, size: 12)
    }
}
