//
//  ViewController.swift
//  Assignment1
//
//  Created by user233437 on 5/29/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calScreen: UILabel!
    
    @IBOutlet weak var displayView: UITextView!
    
    var isAdvance: Bool = false
    
    var calculator = (UIApplication.shared.delegate as! AppDelegate).calculate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func UpdateScreen(_ sender: UIButton) {
        
        var input : String = (sender.titleLabel?.text!)!
        calScreen.text?.append(input + " ")
        calculator.input = input
        calculator.push(v:input)
        
    }
    
    @IBAction func ClearScreen(_ sender: Any) {
        
        calScreen.text=""
        calculator.list = [String]()
    }
    
    
    @IBAction func Calculate(_ sender: UIButton) {
        
        var result = calculator.calculate()
        
        if result != 88888888{
            calScreen.text?.append("= ")
            calScreen.text?.append(String(result))
            calculator.list = [String]()
            
        }else {
            calScreen.text = "Invalid input. Please return"
        }
        
        //check if it is in Advance mode or not
        if isAdvance == true{
            
            displayView.text?.append(calScreen.text! + "\n")
            
            }
        
    }
    
    
    @IBAction func clickedToAdvance(_ sender: UIButton) {
        
        if  isAdvance == false{
            sender.setTitle("Standard - No History", for: .normal)
            displayView.backgroundColor = UIColor.lightGray
            displayView.isEditable = false
            isAdvance = true
            
        } else{
            sender.setTitle("Advance - With History", for: .normal)
            displayView.isEditable = false
            displayView.backgroundColor = UIColor.white
            displayView.text? = ""
            isAdvance = false
        }
        
    }
    
    
}

