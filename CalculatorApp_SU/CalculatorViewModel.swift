//
//  CalculatorViewModel.swift
//  CalculatorApp_SU
//
//  Created by Students on 19.03.2023.
//

import Foundation

class CalculatorViewModel: ObservableObject {
    
    @Published private var calculator = Calculator()
    
    var text: String {
        return calculator.text
    }
    
    var buttons: [[AllButton]] {
        [[.allClear, .negative, .percent, .operation(.division)],
         [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiplication)],
         [.digit(.four), .digit(.five), .digit(.six), .operation(.subtraction)],
         [.digit(.one), .digit(.two), .digit(.three), .operation(.addition)],
         [.digit(.zero), .decimal, .equal]]
    }
    
    // connect Model and functions in calculator (View Model)
    func performAction(button: AllButton) {
        switch button {
        case .digit(let digit):
            calculator.setDigit(digit)
        case .operation(let operation):
            calculator.setOperation(operation)
        case .negative:
            calculator.toggleSign()
        case .percent:
            calculator.setPercent()
        case .decimal:
            calculator.setDecimal()
        case .equal:
            calculator.evaluate()
        case .allClear:
            calculator.allClear()
        case .clear:
            calculator.clear()
        }
    }
}
