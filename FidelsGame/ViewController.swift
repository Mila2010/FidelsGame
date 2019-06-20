//
//  ViewController.swift
//  FidelsGame
//
//  Created by Valentina Urakhchinskaya on 6/17/19.
//  Copyright © 2019 Valentina Urakhchinskaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tapCount = 0
    
    var speed = 0.0
    
    var animationIsActive = true
    
    @IBOutlet weak var buttonStopStart: UIBarButtonItem!
    
    @IBOutlet weak var animationButton: UIButton!
    
    override func viewDidLoad(){
        fidelsAnimation(animationButton: animationButton)
    }
    @IBAction func sayRrrMeow() {
        tapCount+=1
        print(tapCount)
    }
    
    @IBAction func gameStopStart(_ sender: UIBarButtonItem) {
        if(animationIsActive){
            //TODO: display results
            animationIsActive = false
            buttonStopStart.title = "Start"
            animationButton.isEnabled = false
        }else {
            animationIsActive = true
            buttonStopStart.title = "Stop"
            animationButton.isEnabled = true
            tapCount = 0
            fidelsAnimation(animationButton: animationButton)
        }
    }
    
    func fidelsAnimation(animationButton: UIButton){
        if(animationIsActive){
        UIView.animate(withDuration: speed, delay: 0.0, options: [.allowUserInteraction], animations: {
            
            let deltaX = CGFloat(Int.random(in: Int(-1 * animationButton.center.x) ... Int(UIScreen.main.bounds.width -  animationButton.center.x)))
            let deltaY = CGFloat(Int.random(in: Int(-1 * animationButton.center.y) ... Int(UIScreen.main.bounds.height - animationButton.center.y)))
            
            animationButton.frame = CGRect(x: animationButton.frame.origin.x + deltaX, y: animationButton.frame.origin.y + deltaY, width: animationButton.frame.width, height: animationButton.frame.height)
            
            
        }, completion: { _ in
            self.fidelsAnimation(animationButton: animationButton)
        })
        }
    }
    
    
}

