//
//  ViewController.swift
//  FidelsGame
//
//  Created by Valentina Urakhchinskaya on 6/17/19.
//  Copyright © 2019 Valentina Urakhchinskaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animationIsActive = false
    
    var speed = 0.0

    @IBAction func sayRrrMeow(_ sender: UIButton) {
    print("Fidel says Rrr-Meow!")
    
        if(!animationIsActive){
            animationIsActive = true
            fidelsAnimation(sender: sender)
        } else {
            animationIsActive = false
        }
        
    }
    
    func fidelsAnimation(sender: UIButton){
        if(animationIsActive){
        UIView.animate(withDuration: speed, delay: 0.0, options: [.allowUserInteraction], animations: {
            
            let deltaX = CGFloat(Int.random(in: Int(-1 * sender.center.x) ... Int(UIScreen.main.bounds.width -  sender.center.x)))
            let deltaY = CGFloat(Int.random(in: Int(-1 * sender.center.y) ... Int(UIScreen.main.bounds.height - sender.center.y)))
            
            sender.frame = CGRect(x: sender.frame.origin.x + deltaX, y: sender.frame.origin.y + deltaY, width: sender.frame.width, height: sender.frame.height)
            
            
        }, completion: { _ in
            self.fidelsAnimation(sender: sender)
        })
        }
    }
    
    
}

