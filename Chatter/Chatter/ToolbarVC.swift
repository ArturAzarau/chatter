//
//  ToolbarVC.swift
//  Chatter
//
//  Created by Artur Azarov on 08.09.17.
//  Copyright © 2017 Artur Azarov. All rights reserved.
//

import Cocoa

final class ToolbarVC: NSViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var loginImage: NSImageView!
    @IBOutlet weak var loginLabel: NSTextField!
    @IBOutlet weak var loginStack: NSStackView!
    
    
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
        view.layer?.backgroundColor = NSColor.chatGreen.cgColor
        
        loginStack.gestureRecognizers.removeAll()
        let profilePage = NSClickGestureRecognizer(target: self, action: #selector(openProfilePage(_:)))
        loginStack.addGestureRecognizer(profilePage)
    }
    
    @objc private func openProfilePage(_ recognizer: NSClickGestureRecognizer) {
        print("open profile page")
    }
}
