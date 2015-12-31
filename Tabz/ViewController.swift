//
//  ViewController.swift
//  Tabz
//
//  Created by Edward Punzalan on 12/29/15.
//  Copyright © 2015 Edward Punzalan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var peopleField: UITextField!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var perCapLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "0.00"
        totalLabel.text = "0.00"
        perCapLabel.text = "0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
    var tipPercentages = [0.18, 0.2, 0.22]
    let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
    let numPeople = NSString(string: peopleField.text!).doubleValue
    let billAmount = NSString(string: billField.text!).doubleValue
    let tip = billAmount * tipPercentage
    let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"

        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        perCapLabel.text = String(format: "$%.2f", total/numPeople)

    }
    @IBAction func onPersonChange(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

        
        let numPeople = NSString(string: peopleField.text!).doubleValue
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        perCapLabel.text = "$\(total/numPeople)"
        
        perCapLabel.text = String(format: "$%.2f", total/numPeople)
        
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }


}

