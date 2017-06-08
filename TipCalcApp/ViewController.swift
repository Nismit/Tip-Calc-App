//
//  ViewController.swift
//  TipCalcApp
//
//  Created by Michinobu Nishimoto on 2017-06-07.
//  Copyright © 2017 Michinobu Nishimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var calcTipButton: UIButton!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipPercentageTextField: UITextField!
    @IBOutlet weak var dividedPeople: UITextField!
    @IBOutlet weak var adjustTipPercentage: UISlider!
    
    let step:Float = 1
    var result:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        billAmountTextField.inputAccessoryView = toolBar
        tipPercentageTextField.inputAccessoryView = toolBar
        dividedPeople.inputAccessoryView = toolBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calcFifteenTips(_ sender: UIButton) {
        let tips:Float = 15
        calc(tips: tips)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        //tipPercentageTextField.text = "\(Int(roundedValue))"
        calc(tips: roundedValue)
    }

    func doneClicked() {
        view.endEditing(true)
        if let tips = Float(tipPercentageTextField.text!) {
            calc(tips: tips)
        } else {
            calc(tips: 15)
        }
    }
    
    func calc(tips:Float) {
        if let bill = Float(billAmountTextField.text!) {
            let people:Float = Float(dividedPeople.text!)!
            result = (bill / people) + (bill / people) * (tips / 100)
            tipAmountLabel.text = "\(result)"
        } else {
            tipAmountLabel.text = "NaN"
        }
        
        updateField(tips: tips)
    }
    
    func updateField(tips:Float) {
        tipPercentageTextField.text = "\(Int(tips))"
        adjustTipPercentage.value = tips
    }

}

