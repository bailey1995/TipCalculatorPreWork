//
//  ViewController.swift
//  TipCalculatorPreWork
//
//  Created by Bailey Yee on 1/5/17.
//  Copyright © 2017 Baileyzorz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var billField: UITextField!
    @IBOutlet var tipControl: UISegmentedControl!
    @IBOutlet var editTipView: UIView!
    @IBOutlet var tipPercentageTF: UITextField!
    var tipPercentages = [Double]()
    
 
    @IBAction func editTip(_ sender: Any) {
        animateIn()
    }
    
    @IBAction func doneButton(_ sender: Any) {
        tipControl.setTitle("\(tipPercentageTF.text!)%", forSegmentAt: 2)
        tipPercentages[2] = 0.01 * Double(tipPercentageTF.text!)!
        calcTip()
        animateOut()
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        animateOut()
    }
    
    
    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    func calcTip() {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$ %.2f", tip)
        totalLabel.text = String(format: "$ %.2f", total)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        calcTip()
    }
    
    // Animation for editTipView
    func animateIn() {
        self.view.addSubview(editTipView)
        
        // position addItemView in the middle
        editTipView.center.x = ((self.view.frame.width)/2)
        editTipView.center.y = ((self.view.frame.height)/2)
        
        editTipView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        editTipView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.editTipView.alpha = 1
            self.editTipView.transform = CGAffineTransform.identity
        }
    }
    
    // animation of closing the editTipView
    func animateOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.editTipView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.editTipView.alpha = 0
        }) { (success: Bool) in
            self.editTipView.removeFromSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipControl.setTitle("15%", forSegmentAt: 0)
        tipControl.setTitle("20%", forSegmentAt: 1)
        tipControl.setTitle("25%", forSegmentAt: 2)
        tipPercentages.append(0.15)
        tipPercentages.append(0.20)
        tipPercentages.append(0.25)
        editTipView.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

