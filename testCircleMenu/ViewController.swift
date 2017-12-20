//
//  ViewController.swift
//  testCircleMenu
//
//  Created by Anas Almomany on 12/20/17.
//  Copyright © 2017 Anas Almomany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circleMenu: CustomCircleButton!
    
    var panGesture       = UIPanGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.draggedView(_:)))
        circleMenu.isUserInteractionEnabled = true
        circleMenu.addGestureRecognizer(panGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        self.view.bringSubview(toFront: circleMenu)
        let translation = sender.translation(in: self.view)
        circleMenu.center = CGPoint(x: circleMenu.center.x + translation.x, y: circleMenu.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }

}

