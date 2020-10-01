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
    
        var billTotal = 0.00
        let bill = billTextFilled.text ?? "0.00"
        if bill != ""{
            billTotal = Double(bill)!
            billTotal += (billTotal * tip)
            let sumForEach = String(format: "%.2f", billTotal / Double(numberOfPeople))
            return sumForEach
        }else{
            return "0.00"
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        numberOfPeople = Int(sender.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultPageSegue"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = calculationResult()
            destinationVC.split = numberOfPeople
            destinationVC.tip = Int(tip*100)
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "resultPageSegue", sender: self)
    }
    
}

