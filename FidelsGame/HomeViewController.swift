//
//  HomeViewController.swift
//  FidelsGame
//
//  Created by Valentina Urakhchinskaya on 6/19/19.
//  Copyright © 2019 Valentina Urakhchinskaya. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var selectionView: UIView!
    
    override func viewDidLoad(){
    
       //selectionView constraints
       selectionView.translatesAutoresizingMaskIntoConstraints = false
        selectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        selectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        selectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        //selectionView constraints
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
         startButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @IBOutlet weak var SpeedPickerView: UIPickerView!
    let speedValues = ["low speed", "medium speed", "high speed"]
    
    var speedSelected:TimeInterval = SpeedValues.low.value
    
    enum SpeedValues: Int {
        case low = 0, medium = 1, high = 2
        
        var value: TimeInterval {
            switch self {
            case .low: return 1.5
            case .medium   : return 1.0
            case .high  : return 0.5
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return speedValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return speedValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        speedSelected = SpeedValues(rawValue: row)?.value ?? speedSelected
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ViewController
        {
            let vc = segue.destination as? ViewController
            vc?.speed = speedSelected
        }
    }
}
