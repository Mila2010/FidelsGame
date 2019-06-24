//
//  SplashViewController.swift
//  FidelsGame
//
//  Created by Liudmila Urakhchinskaya on 6/19/19.
//  Copyright © 2019 Valentina Urakhchinskaya. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
@IBOutlet weak var titleToAnimate: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startSplashAnimation()
    }
    
    func startSplashAnimation(){
        UIView.animate(withDuration: 1.5, delay: 0.0, options: [.allowUserInteraction], animations: {
            
            self.titleToAnimate.frame = CGRect(x: self.titleToAnimate.frame.origin.x , y: self.titleToAnimate.frame.origin.y , width: self.titleToAnimate.frame.width + 20,
                                          height: self.titleToAnimate.frame.height + 30)
            
            
        }, completion: { _ in
            self.navigateToHomeScreen()
        })
    
    }
    
    func navigateToHomeScreen(){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "navigationController") as! UINavigationController
        self.present(newViewController, animated: true, completion: nil)
    }
}
