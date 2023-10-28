//
//  ViewController.swift
//  Tipsy
//
//  Created by Harshit Bhargava on 28/10/23.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var zeroPerctBtn: UIButton!
    @IBOutlet weak var tenPerctBtn: UIButton!
    @IBOutlet weak var twentyPerctBtn: UIButton!
    
    var tipSelected = 0
    var totalSplits = 2
    var splitPerPerson = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipsButtonSelected(_ sender: UIButton) {
        billAmountTextField.endEditing(true)
        zeroPerctBtn.isSelected = false
        tenPerctBtn.isSelected = false
        twentyPerctBtn.isSelected = false
        switch sender.titleLabel?.text {
        case "0%": 
            tipSelected = 0
            sender.isSelected = true
            
        case "10%":
            tipSelected = 10
            sender.isSelected = true
        
        case "20%":
            tipSelected = 20
            sender.isSelected = true
            
        default :
            break
            
        }
    }
    
    @IBAction func noOfSplits(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        totalSplits = Int(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let bill = billAmountTextField.text {
            let tipAmount = tipSelected == 0 ? 0 : (Float(bill) ?? 0) * Float(tipSelected) * 0.01
            let totalBill = (Float(bill) ?? 0) + tipAmount
            splitPerPerson = Double(totalBill / Float(totalSplits))
            
            self.performSegue(withIdentifier: "showSplit", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSplit" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.splitPerPerson = Double(splitPerPerson)
            destinationVC.tipSelected = tipSelected
            destinationVC.totalSplits = totalSplits
        }
    }
    
}

