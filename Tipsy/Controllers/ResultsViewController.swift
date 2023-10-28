//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Harshit Bhargava  on 28/10/23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var splitPerPerson = 0.0
    var totalSplits = 0
    var tipSelected = 0
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var summaryStatement: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        splitLabel.text = "\(splitPerPerson)"
        summaryStatement.text = "Split between \(totalSplits) people, with \(tipSelected)% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
