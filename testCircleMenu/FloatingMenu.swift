////
////  FloatingMenu.swift
////  testCircleMenu
////
////  Created by Anas Almomany on 12/20/17.
////  Copyright © 2017 Anas Almomany. All rights reserved.
////
//
//import UIKit
//
//class FloatingButtonController: UIViewController {
//
//    fileprivate var button: CustomCircleButton = {
//        return CustomCircleButton(
//            frame: CGRect(x: 200, y: 200, width: 50, height: 50),
//            normalIcon:"icon_menu",
//            selectedIcon:"icon_close",
//            buttonsCount: 4,
//            duration: 4,
//            distance: 120)
//    }()
//    init() {
//        super.init(nibName: nil, bundle: nil)
//        window.windowLevel = CGFloat.greatestFiniteMagnitude
//        window.isHidden = false
//        window.rootViewController = self
//
//    }
//
//    private let window = FloatingButtonWindow()
//
//    override func loadView() {
//        let view = UIView()
//        view.addSubview(button)
//        self.view = view
//        window.button = button
//
////        let panner = UIPanGestureRecognizer(target: self, action: #selector(panDidFire(_:)))
////        button.addGestureRecognizer(panner)
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
////        snapButtonToSocket()
//    }
//
////    @objc func panDidFire(_ panner: UIPanGestureRecognizer) {
////        let offset = panner.translation(in: view)
////        panner.setTranslation(CGPoint.zero, in: view)
////        var center = button.center
////        center.x += offset.x
////        center.y += offset.y
////        button.center = center
////        if panner.state == .ended || panner.state == .cancelled {
////            UIView.animate(withDuration: 0.3) {
////                self.snapButtonToSocket()
////            }
////        }
////    }
//
//    //    private func snapButtonToSocket() {
////        var bestSocket = CGPoint.zero
////        var distanceToBestSocket = CGFloat.infinity
////        let center = button.center
////        for socket in sockets {
////            let distance = hypot(center.x - socket.x, center.y - socket.y)
////            if distance < distanceToBestSocket {
////                distanceToBestSocket = distance
////                bestSocket = socket
////            }
////        }
////        button.center = bestSocket
////    }
////
////    private var sockets: [CGPoint] {
////        let buttonSize = button.bounds.size
////        let rect = view.bounds.insetBy(dx: 4 + buttonSize.width / 2, dy: 4 + buttonSize.height / 2)
////        let sockets: [CGPoint] = [
////            CGPoint(x: rect.minX,y: rect.minY),
////            CGPoint(x: rect.minX,y: rect.minY),
////            CGPoint(x: rect.minX,y: rect.minY),
////            CGPoint(x: rect.minX,y: rect.minY),
////            CGPoint(x: rect.minX,y: rect.minY)
////        ]
////        return sockets
////    }
//
//}
//
//private class FloatingButtonWindow: UIWindow {
//    var button: CustomCircleButton?
//
//    init() {
//        super.init(frame: UIScreen.main.bounds)
//        backgroundColor = nil
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
////
////    fileprivate override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
////        guard let button = button else { return false }
////        let buttonPoint = convert(point, to: button)
////        return button.point(inside: buttonPoint, with: event)
////    }
//}

