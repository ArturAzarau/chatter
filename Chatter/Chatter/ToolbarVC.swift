//
//  ToolbarVC.swift
//  Chatter
//
//  Created by Artur Azarov on 08.09.17.
//  Copyright © 2017 Artur Azarov. All rights reserved.
//

import Cocoa

enum ModalType {
    case logIn
}

final class ToolbarVC: NSViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var loginImage: NSImageView!
    @IBOutlet weak var loginLabel: NSTextField!
    @IBOutlet weak var loginStack: NSStackView!
    
    // MARK: - Variables
    
    var modalBackgroundView: ClickBlockingView!
    var modalView: NSView!
    
    // MARK: - Life cycle
    
    override func viewWillAppear() {
        super.viewWillAppear()
        setUpView()
    }
    
    // MARK: - View methods
    
    private func setUpView() {
        // setup observer
        
        NotificationCenter.default.addObserver(self, selector: #selector(presentModal(_:)), name: Notifications.Names.notifPresentModal, object: nil)
        
        // setup main view
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.chatGreen.cgColor
        
        // setup login stack view
        
        loginStack.gestureRecognizers.removeAll()
        let profilePage = NSClickGestureRecognizer(target: self, action: #selector(openProfilePage(_:)))
        loginStack.addGestureRecognizer(profilePage)
    }
    
    // MARK: - Helpers
    
    @objc private func openProfilePage(_ recognizer: NSClickGestureRecognizer) {
        let loginDict: [String: ModalType] = [Notifications.userInfoModal: ModalType.logIn]
        NotificationCenter.default.post(name: Notifications.Names.notifPresentModal, object: nil, userInfo: loginDict)
    }
    
    @objc private func presentModal(_ notification: Notification) {
        var modalWidth: CGFloat = 0
        var modalHeight: CGFloat = 0
        if modalBackgroundView == nil {
            modalBackgroundView = ClickBlockingView()
            modalBackgroundView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(modalBackgroundView, positioned: .above, relativeTo: loginStack)
            let topConstraint = NSLayoutConstraint(item: modalBackgroundView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 50)
            let leftConstraint = NSLayoutConstraint(item: modalBackgroundView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
            let rightConstraint = NSLayoutConstraint(item: modalBackgroundView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: modalBackgroundView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
            view.addConstraints([topConstraint,bottomConstraint,leftConstraint,rightConstraint])
            modalBackgroundView.layer?.backgroundColor = NSColor.black.cgColor
            modalBackgroundView.alphaValue = 0
            
            let closeBackgroundClick = NSClickGestureRecognizer(target: self, action: #selector(closeModalClick(_:)))
            modalBackgroundView.addGestureRecognizer(closeBackgroundClick)
            
            // Instatiate XIB
            
            guard let modalType = notification.userInfo?[Notifications.userInfoModal] as? ModalType else { return }
            
            switch modalType {
            case .logIn:
                modalView = ModalLogin()
                modalWidth = 475
                modalHeight = 300
            }
            
            modalView.wantsLayer = true
            modalView.translatesAutoresizingMaskIntoConstraints = false
            modalView.alphaValue = 0
            view.addSubview(modalView, positioned: .above, relativeTo: modalBackgroundView)
            
            let horizontalConstraint = modalView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let verticalConstraint = modalView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            let widthConstraint = modalView.widthAnchor.constraint(equalToConstant: modalWidth)
            let heightConstraint = modalView.heightAnchor.constraint(equalToConstant: modalHeight)
            NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint,widthConstraint,heightConstraint])
        }
        
        NSAnimationContext.runAnimationGroup({ (context) in
            context.duration = 0.5
            modalBackgroundView.animator().alphaValue = 0.6
            modalView.animator().alphaValue = 1.0
            self.view.layoutSubtreeIfNeeded()
        }, completionHandler: nil)
    }
    
    private func closeModal() {
        NSAnimationContext.runAnimationGroup({ (context) in
            context.duration = 0.5
            modalView.animator().alphaValue = 0
            modalBackgroundView.animator().alphaValue = 0
            self.view.layoutSubtreeIfNeeded()
        }) {
            if self.modalBackgroundView != nil {
                self.modalBackgroundView.removeFromSuperview()
                self.modalBackgroundView = nil
            }
            self.modalView.removeFromSuperview()
        }
    }
    
    @objc private func closeModalClick(_ recognizer: NSGestureRecognizer) {
        closeModal()
    }
    
    
}
