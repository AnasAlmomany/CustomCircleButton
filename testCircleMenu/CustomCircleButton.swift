//
//  CustomCircleButton.swift
//  testCircleMenu
//
//  Created by Anas Almomany on 12/20/17.
//  Copyright © 2017 Anas Almomany. All rights reserved.
//

import Foundation
import CircleMenu

class CustomCircleButton : CircleMenu{

}
extension CustomCircleButton : CircleMenuDelegate  {
    // configure buttons
    func circleMenu(_ circleMenu: CircleMenu, willDisplay button: UIButton, atIndex: Int){
        
    }
    // call before animation
    func circleMenu(_ circleMenu: CircleMenu, buttonWillSelected button: UIButton, atIndex: Int){
        
    }
    // call after animation
    func circleMenu(_ circleMenu: CircleMenu, buttonDidSelected button: UIButton, atIndex: Int){
        
    }
    
    // call upon cancel of the menu
    func menuCollapsed(_ circleMenu: CircleMenu){
        
    }
}
