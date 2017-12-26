//
//  FloatingVC.swift
//  testCircleMenu
//
//  Created by Anas Almomany on 12/21/17.
//  Copyright © 2017 Anas Almomany. All rights reserved.
//

import Foundation

import UIKit
import CircleMenu

class FloatingButtonController: UIViewController {
    private(set) var floatingView: UIView!
    private let window = FloatingButtonWindow()
    private var panGesture       = UIPanGestureRecognizer()

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        window.windowLevel = CGFloat.greatestFiniteMagnitude
        window.isHidden = false
        window.rootViewController = self
        NotificationCenter.default.addObserver(self, selector:  #selector(FloatingButtonController.keyboardDidShow(note:)), name: Notification.Name.UIKeyboardDidShow, object: nil)
    }
    override func loadView() {
        let view = UIView()
        let customButton = CustomCircleButton(
                        frame: CGRect(x: 200, y: 200, width: 50, height: 50),
                        normalIcon:"menu_Icon",
                        selectedIcon:"menu_Icon",
                        buttonsCount: 5,
                        duration: 0.2,
                        distance: 120)
        customButton.imageView?.contentMode = .scaleAspectFit
        customButton.setTitleColor(UIColor.green, for: .normal)
        customButton.layer.shadowColor = UIColor.black.cgColor
        customButton.layer.shadowRadius = 3
        customButton.layer.shadowOpacity = 0.8
        customButton.layer.shadowOffset = CGSize.zero
        customButton.sizeToFit()
        customButton.frame = CGRect(x: 200, y: 200, width: 50, height: 50)
        customButton.autoresizingMask = []
        customButton.delegate = self
    
        view.addSubview(customButton)
        self.view = view
        self.floatingView = customButton
        window.menu = customButton
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(draggedView(_:)))
        customButton.addGestureRecognizer(panGesture)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        self.view.bringSubview(toFront: floatingView)
        let translation = sender.translation(in: self.view)
        floatingView.center = CGPoint(x: floatingView.center.x + translation.x, y: floatingView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    @objc func keyboardDidShow(note: NSNotification) {
        window.windowLevel = 0
        window.windowLevel = CGFloat.greatestFiniteMagnitude
        window.menu?.layer.zPosition = CGFloat.greatestFiniteMagnitude
    }
}
extension FloatingButtonController : CircleMenuDelegate  {
    // configure buttons
    func circleMenu(_ circleMenu: CircleMenu, willDisplay button: UIButton, atIndex: Int){
        print("circleMenu(_ circleMenu: CircleMenu, willDisplay button: UIButton, atIndex: Int)")
    }
    // call before animation
    func circleMenu(_ circleMenu: CircleMenu, buttonWillSelected button: UIButton, atIndex: Int){
        print("circleMenu(_ circleMenu: CircleMenu, buttonWillSelected button: UIButton, atIndex: Int)")
    }
    // call after animation
    func circleMenu(_ circleMenu: CircleMenu, buttonDidSelected button: UIButton, atIndex: Int){
        print("circleMenu(_ circleMenu: CircleMenu, buttonDidSelected button: UIButton, atIndex: Int)")
    }
    
    // call upon cancel of the menu
    func menuCollapsed(_ circleMenu: CircleMenu){
        print("menuCollapsed(_ circleMenu: CircleMenu)")
    }
}
private class FloatingButtonWindow: UIWindow {
    var menu: CustomCircleButton?
    init() {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = nil
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if let menu = menu {
            let insideMenu = menu.point(inside:  convert(point, to: menu), with: event)
            var insideButtons = false
            if let pointsInsideButtons = menu.buttons?.map({ (btn) -> Bool in
                return btn.point(inside:  convert(point, to: btn), with: event)
            }){
                insideButtons =  pointsInsideButtons.contains(true)
            }
            return insideMenu || insideButtons
        }
        return false
    }
}
