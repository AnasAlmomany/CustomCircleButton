//
//  FloatingVC.swift
//  testCircleMenu
//
//  Created by Anas Almomany on 12/21/17.
//  Copyright © 2017 Anas Almomany. All rights reserved.
//

import Foundation

import UIKit

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
    }
    override func loadView() {
        let view = UIView()
        let customButton = CustomCircleButton(
                        frame: CGRect(x: 200, y: 200, width: 50, height: 50),
                        normalIcon:"menu_Icon",
                        selectedIcon:"menu_Icon",
                        buttonsCount: 5,
                        duration: 4,
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
        window.button = customButton
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
}
private class FloatingButtonWindow: UIWindow {
    var button: UIButton?
    init() {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = nil
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        guard let button = button else { return false }
        let buttonPoint = convert(point, to: button)
        return button.point(inside: buttonPoint, with: event)
    }
}
