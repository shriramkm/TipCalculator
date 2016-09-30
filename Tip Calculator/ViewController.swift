//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Kalpathy Mohan, Shriram on 9/25/16.
//  Copyright © 2016 Kalpathy Mohan, Shriram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var tipField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var totalField: UITextField!
    @IBOutlet weak var currentTipPercentage: UILabel!
    var currencySymbol:String = "$"
    var defaultTip:Int = 15
    var selectedCurrencyRow:Int = 2
    var selectedDefaultTipRow:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let paddingView = UIView(frame: CGRectMake(0, 0, 30, totalField.frame.height))
        totalField.rightView = paddingView
        totalField.rightViewMode = UITextFieldViewMode.Always
    }
    
    override func viewWillAppear(animated: Bool) {
        tipSlider.setValue(Float(defaultTip), animated: true)
        calculateTotalAmount(tipSlider)
        amountField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func viewTapped(sender: AnyObject) {
        calculateTotalAmount(self)
    }
    
    func clearCurrencySymbols(){
        amountField.text = amountField.text?.stringByReplacingOccurrencesOfString(currencySymbol + " " , withString: "")
        tipField.text = tipField.text?.stringByReplacingOccurrencesOfString(currencySymbol + " " , withString: "")
        totalField.text = totalField.text?.stringByReplacingOccurrencesOfString(currencySymbol + " " , withString: "")
    }
    
    @IBAction func calculateTotalAmount(sender: AnyObject) {
        clearCurrencySymbols()
        guard let amountText = amountField.text else {
            amountField.text = ""
            tipField.text = ""
            totalField.text = ""
            return }
        
        if sender.isKindOfClass(UISlider) {
            let tipPercentage = tipSlider.value
            let amount:Float? = Float(amountText)
            if let amount = amount {
                let tipAmount = amount*tipPercentage/100
                amountField.text = String.init(format: "%.2f", amount)
                tipField.text = String.init(format: "%.2f", tipAmount)
                totalField.text = String.init(format: "%.2f", amount + tipAmount)
            }
        }
        else {
            let amount:Float? = Float(amountText)
            if tipField.text != "" {
                if let tipAmount = tipField.text, amount = amount {
                    amountField.text = String.init(format: "%.2f", amount)
                    if let tipAmt = Float(tipAmount) {
                        tipField.text = String.init(format: "%.2f", tipAmt)
                        totalField.text = String.init(format: "%.2f", amount + Float(tipAmount)!)
                        tipSlider.value = (Float(tipAmount)!/amount)*100
                    }
                }
            }
            else if let amount = amount {
                amountField.text = String.init(format: "%.2f", amount)
                tipField.text = String.init(format: "%.2f", 0.00)
                totalField.text = String.init(format: "%.2f", amount)
                tipSlider.value = 0
            }
        }
        var currentTip = currentTipPercentage.text!.componentsSeparatedByString(":")[0]
        currentTip = currentTip + String.init(format:": %.0f", tipSlider.value) + "%"
        currentTipPercentage.text = currentTip
        
        if let amountTextValue = amountField.text {
            if amountTextValue.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()) != "" {
                amountField.text = currencySymbol + " " + amountTextValue
            }
        }
        if let tipTextValue = tipField.text {
            if tipTextValue.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()) != "" {
                tipField.text = currencySymbol + " " + tipTextValue
            }
        }
        if let totalFieldValue = totalField.text {
            if totalFieldValue.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != "" {
                totalField.text = currencySymbol + " " + totalFieldValue
            }
        }
    }
}