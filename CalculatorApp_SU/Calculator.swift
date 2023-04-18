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
    private var expression: ArithmeticExpression?
    private var result: Decimal?
    
    private var currentNumber: Decimal? {
        newNumber ?? expression?.firstNumber ?? result
    }
    
    var displayText: String {
        return getNumberString(number: currentNumber, withCommas: true)
    }
    
    // MARK: struct
    
    private struct ArithmeticExpression {
        var firstNumber: Decimal
        var operation: ArithmeticOperation
        
        // why num1 set apart from num2
        func calculate(with secondNumber: Decimal) -> Decimal {
            switch operation {
            case .addition:
                return firstNumber + secondNumber
            case .subtraction:
                return firstNumber - secondNumber
            case .multiplication:
                return firstNumber * secondNumber
            case .division:
                return firstNumber / secondNumber
            }
        }
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
    
    mutating func setOperation(_ operation: ArithmeticOperation) {
            // set to number of new value or result of previous expression
            guard var number = newNumber ?? result else { return }
            // if earlier user make evaluation -> do this operation again
            if let existingExpression = expression {
                number = existingExpression.calculate(with: number)
            }
            // if not previous operation or user choose another operation -> set this expression
            expression = ArithmeticExpression(firstNumber: number, operation: operation)
            // 4.
            newNumber = nil
        }
    
/*
 Unwrap newNumber and expression (expression contains the previous number and operation)
 Evaluate expression with newNumber and assign to result
 Reset expression and newNumber
 */
    
    mutating func evaluate() {
            guard let number = newNumber, let expressionToEvaluate = expression else { return }
            result = expressionToEvaluate.calculate(with: number)
            expression = nil
            newNumber = nil
    }
    
    mutating func allClear() {
    }
    
    mutating func clear() {
    }
    
    mutating func toggleSign() {
    }
    
    mutating func setPercent() {
    }
    
        
    mutating func setDecimal() {
    }
    
}

