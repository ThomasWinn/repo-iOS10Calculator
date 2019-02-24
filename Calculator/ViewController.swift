//
//  ViewController.swift
//  Calculator
//
//  Created by Thomas Nguyen on 9/3/18.
//  Copyright © 2018 Thomas Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var operation:Int = 0
    var performingMath:Bool = false
    
    @IBAction func numberButton(_ sender: UIButton) {
        
        if performingMath == true {
            // After they press an operator
            Label.text = String(sender.tag-1)
            numberOnScreen = Double(Label.text!)!
            performingMath = false
            
        }
        else {
            // When they start touching buttons before they press an operator
            Label.text = Label.text! + String(sender.tag-1)
            numberOnScreen = Double(Label.text!)!
            
        }
        
    }
    
    /*
        TODO:
        Make it so user can't spam operators to perform fatal error.
 
    */
    
    @IBAction func operationButton(_ sender: UIButton) {
        
        
        if Label.text != "" && sender.tag != 15 {
            
            // Because the number before will disappear
            previousNumber = Double(Label.text!)!
            
            switch sender.tag {
            case 11: // Divide
                Label.text = "/"
            case 12: // Multiply
                Label.text = "X"
            case 13: // Subtraction
                Label.text = "-"
            case 14: // Addition
                Label.text = "+"
            case 15: // Equals
                Label.text = "="
            case 17: // Divide by 100
                numberOnScreen = Double( previousNumber / 100)
                Label.text = String(numberOnScreen)
            default:
                Label.text = ""
            }
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 15 {
            switch operation {
            case 11:
                Label.text = String(previousNumber / numberOnScreen)
            case 12:
                Label.text = String(previousNumber * numberOnScreen)
            case 13:
                Label.text = String(previousNumber - numberOnScreen)
            case 14:
                Label.text = String(previousNumber + numberOnScreen)
            case 17:
                Label.text = String(previousNumber / 100)
            default:
                Label.text = ""
            }
        }
        
        }
    
    @IBAction func clearDecimalNegativePositiveControl(_ sender: UIButton) {
        if sender.tag == 0 { // Clear
            numberOnScreen = 0
            Label.text = ""
        }
            
        else if sender.tag == 16 { // Negative/Positive Operator
            if numberOnScreen == 0 {
                Label.text = ""
            }
            else {
                numberOnScreen = -Double(Label.text!)!
                Label.text = String(numberOnScreen)
            }

        }
        else if sender.tag == 19 { // Decimal
            
            if (Label.text?.contains("."))! {
                Label.text = ""
                
            }
            else {
 
                numberOnScreen = Double(Label.text!)!
                Label.text = String(Label.text! + ".")
            }
            /*
            TODO:
            If there is a decimal already make decimal button useless
            */
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

