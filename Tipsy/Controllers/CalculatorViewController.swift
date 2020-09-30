//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextFilled: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tip = 0.1
    
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender.currentTitle == "0%" {
            tip = 0.0
            deselectAllButtons()
            zeroPctButton.isSelected = true
        }else if sender.currentTitle == "10%" {
            tip = 0.1
            deselectAllButtons()
            tenPctButton.isSelected = true
        }else {
            tip = 0.2
            deselectAllButtons()
            twentyPctButton.isSelected = true
        }
    }
    
    func deselectAllButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(tip)
    }
    
}

