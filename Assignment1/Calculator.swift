//
//  Calculator.swift
//  Assignment1
//
//  Created by user233437 on 5/29/23.
//

import Foundation

class Calculator{
    
    var list = [String]()
    var input: String
    
    init(){
        list =	[String]()
        input = ""
    }
    
    func push(v:String){
        list.append(input)
        
    }
        
    func calculate() -> Int {
        var result: Int?
        var currentOperator: String?

        guard list.count % 2 == 1 else {
            print("Invalid list. The number of elements should be odd.")
            return 88888888
        }

        for (index, element) in list.enumerated() {
            if index % 2 == 0 {
                // If the element is at an even index (integer position)
                guard let value = Int(element) else {
                    print("Invalid list. Element at index \(index) should be an integer.")
                    return 88888888
                }
                if result == nil {
                    result = value
                } else {
                    if let op = currentOperator {
                        switch op {
                        case "+":
                            result! += value
                        case "-":
                            result! -= value
                        case "*":
                            result! *= value
                        case "/":
                            result! /= value
                        default:
                            break
                        }
                    }
                }
            } else {
                // If the element is at an odd index (operator position)
                if let _ = Int(element) {
                    print("Invalid list. Element at index \(index) should be an operator.")
                    return 88888888
                }
                currentOperator = element
            }
        }

            return result ?? 0
    }

}
