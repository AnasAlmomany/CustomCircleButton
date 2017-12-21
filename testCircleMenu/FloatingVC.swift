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
    private(set) var button: UIButton!
    private let window = FloatingButtonWindow()
    
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
        let button = UIButton(type: .custom)
        button.setTitle("Floating", for: .normal)
        button.setTitleColor(UIColor.green, for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize.zero
        button.sizeToFit()
        button.frame = CGRect(origin: CGPoint(x:10,y: 10), size: button.bounds.size)
        button.autoresizingMask = []
        view.addSubview(button)
        self.view = view
        self.button = button
        window.button = button
//        let panner = UIPanGestureRecognizer(target: self, action: #selector())
//        button.addGestureRecognizer(panner)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        snapButtonToSocket()
    }
    private func snapButtonToSocket() {
        var bestSocket = CGPoint.zero
        var distanceToBestSocket = CGFloat.infinity
        let center = button.center
        for socket in sockets {
            let distance = hypot(center.x - socket.x, center.y - socket.y)
            if distance < distanceToBestSocket {
                distanceToBestSocket = distance
                bestSocket = socket
            }
        }
        button.center = bestSocket
    }
    
    private var sockets: [CGPoint] {
        let buttonSize = button.bounds.size
        let rect = view.bounds.insetBy(dx: 4 + buttonSize.width / 2, dy: 4 + buttonSize.height / 2)
        let sockets: [CGPoint] = [
            CGPoint(x:rect.minX,y: rect.minY),
            CGPoint(x:rect.minX,y: rect.minY),
            CGPoint(x:rect.minX,y: rect.minY),
            CGPoint(x:rect.minX,y: rect.minY),
            CGPoint(x:rect.minX,y: rect.minY)
        ]
        return sockets
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
