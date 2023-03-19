//
//  Calculator.swift
//  CalculatorApp_SU
//
//  Created by Students on 19.03.2023.
//

import SwiftUI

struct Calculator {
    
    //MARK: Properties
    
    var text: String {
        return "0"
    }
    
    // Empty Decimal: creates a decimal initialized to 0.
    private var newNumber: Decimal?
    
    private var currentNumber: Decimal? {
        newNumber
    }
    
    var displayText: String {
        return getNumberString(number: currentNumber, withCommas: true)
    }
    
    
    
    //MARK: Functions
    
    private func getNumberString(number: Decimal?, withCommas: Bool = false) -> String {
        return (withCommas ? number?.formatted(.number) : number.map(String.init)) ?? "0" // ?
    }
    
    // check if calculator can add digit: number not nil or digit not 0
    private func checkIsAdd(_ digit: Digit) -> Bool {
        return currentNumber != nil || digit != .zero
    }
    
    mutating func setDigit(_ digit: Digit) {
        // check if you can add currentNumber to numberString: You can not do this if currentNumber = nil or if digit = 0 (0 replace to next digit)
        guard checkIsAdd(digit) else { return }
        // get newNumber and convert it to string
        let numberString = getNumberString(number: newNumber)
        // add digit to the end of numberString and convert it to string of type Decimal and assign it to newNumber
        newNumber = Decimal(string: numberString.appending("\(digit.rawValue)"))
    }
    
    mutating func allClear() {
    }
    
    mutating func clear() {
    }
    
    mutating func toggleSign() {
    }
    
    mutating func setPercent() {
    }
    
    mutating func setOperation(_ operation: ArithmeticOperation) {
    }
        
    mutating func setDecimal() {
    }
    
    mutating func evaluate() {
    }
}

