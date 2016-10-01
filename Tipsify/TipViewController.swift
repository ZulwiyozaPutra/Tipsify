//
//  ViewController.swift
//  Tipsify
//
//  Created by Zulwiyoza Putra on 7/9/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class TipViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.billAmountField.delegate = self
        // Dispose of any resources that can be recreated.
    }
    
    func validateBillAmount(text: String) -> Bool {
        var result = false
        if text != "0.00" {
            result = true
        }
        return result
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        guard let billAmount = Double(billAmountField.text!) else {
            //show error
            billAmountField.text = "0.00"
            tipAmountLabel.text = "0.00"
            totalAmountLabel.text = "0.00"
            return
        }
        
        var tipPercentage = 0.0
        
        switch tipSelector.selectedSegmentIndex {
        case 0:
            tipPercentage = 0.15
        case 1:
            tipPercentage = 0.18
        case 2:
            tipPercentage = 0.20
        default:
            break
        }
        
        let roundedBillAmount = round(100*billAmount)/100
        let tipAmount = roundedBillAmount * tipPercentage
        let roundedTipAmount = round(100*tipAmount)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        if (!billAmountField.isEditing) {
            billAmountField.text = String(format: "%.2f", roundedBillAmount)
        }
        tipAmountLabel.text = String(format: "%.2f", roundedTipAmount)
        totalAmountLabel.text = String(format: "%.2f", totalAmount)
        totalLabel.text = String("Total Amount")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}


    
   
