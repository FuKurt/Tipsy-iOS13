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
    var numberOfPeople = 2
    
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
        billTextFilled.endEditing(true)
    }
    
    func deselectAllButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    func calculationResult() -> String{
        var bill = Double(billTextFilled.text ?? "0.00")
        bill! += (bill! * tip)
        let sumForEach = String(format: "%.2f", bill! / Double(numberOfPeople))
        return sumForEach
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let paymentForEach = calculationResult()
        print(paymentForEach)
    }
    
}

