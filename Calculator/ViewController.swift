//
//  ViewController.swift
//  Calculator
//
//  Created by Mac on 02/12/23.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet var calButton: [UIButton]!
    
    
    
    @IBOutlet weak var calculatorResult: UILabel!
    var myCalculator : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        updateCalculatorResult()

    }
    func clearAll()
    {
    myCalculator = ""
        calculatorResult.text = ""
    }
    

    @IBAction func allClearTap(_ sender: Any)
    {
        clearAll()
        updateCalculatorResult()
    }
    

    func addToWorking(value: String) {
           if let lastChar = myCalculator.last {
               // Check if the last character is an operator
               if "+-*/".contains(lastChar) && "+-*/".contains(value) {
                   // Replace the last operator with the new one
                   myCalculator.removeLast()
               }
           }
           myCalculator += value
           calculatorResult.text = myCalculator
       }

    
    @IBAction func equalTap(_ sender: Any)
    {
       doCalculation()
    }
    
    func doCalculation() {
        if !myCalculator.isEmpty {
            let expression = NSExpression(format: myCalculator)
            if let result = expression.expressionValue(with: nil, context: nil) as? Double {
                let resultString = formatResult(result: result)
                calculatorResult.text = resultString
            }
        }
    }


    
    func formatResult(result : Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else{
            return String(format: "%.2f", result)

        }
    }
    @IBAction func divisionTap(_ sender: Any)
    {
        addToWorking(value: "/")
    }
    @IBAction func multiplyTap(_ sender: Any)
    {
        addToWorking(value: "*")
    }
    @IBAction func minusTap(_ sender: Any)
    {
        addToWorking(value: "-")
    }
    @IBAction func plusTap(_ sender: Any)
    {
        addToWorking(value: "+")
    }
    
    @IBAction func zeroTap(_ sender: Any)
    {
        addToWorking(value: "0")
    }
    @IBAction func sevenTap(_ sender: Any)
    {
        addToWorking(value: "7")
    }
    @IBAction func eightTap(_ sender: Any)
    {
        addToWorking(value: "8")
    }
    
    @IBAction func nineTap(_ sender: Any)
    {
        addToWorking(value: "9")
    }
    @IBAction func sixTap(_ sender: Any)
    {
        addToWorking(value: "6")
    }

    @IBAction func fiveTap(_ sender: Any)
    {
        addToWorking(value: "5")
    }
    
    @IBAction func fourTap(_ sender: Any)
    {
        addToWorking(value: "4")
    }
    @IBAction func threeTap(_ sender: Any)
    {
        addToWorking(value: "3")
    }
    @IBAction func twoTap(_ sender: Any)
    {
        addToWorking(value: "2")
    }
    @IBAction func oneTap(_ sender: Any)
    {
        addToWorking(value: "1")
    }
    func updateCalculatorResult() {
           calculatorResult.text = myCalculator.isEmpty ? "0" : myCalculator
       }
   
}

