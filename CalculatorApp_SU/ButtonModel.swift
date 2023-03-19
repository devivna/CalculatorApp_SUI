//
//  ButtonModel.swift
//  CalculatorApp_SU
//
//  Created by Students on 19.03.2023.
//

import Foundation
import SwiftUI

enum Digit: Int {
    case zero = 0, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        return "\(self.rawValue)"
    }
}

enum ArithmeticOperation: String {
    case addition = "plus"
    case subtraction = "minus"
    case multiplication = "xmark"
    case division = "divide"
}

// Generic struct 'ForEach' requires that 'Button' conform to 'Hashable'
enum AllButton: Hashable {
    case digit(_ digit: Digit)
    case operation(_ operation: ArithmeticOperation)
    case equal
    case percent
    case negative
    case clear
    case allClear
    case decimal
    
    var description: String {
        switch self {
        case .digit(let digit):
            return String(digit.rawValue)
        case .operation(let operation):
            return operation.rawValue
        case .equal:
            return "equal"
        case .percent:
            return "percent"
        case .negative:
            return "plus.slash.minus"
        case .clear:
            return "C"
        case .allClear:
            return "AC"
        case .decimal:
            return ","
        }
    }
        
    var backgroundColor: Color {
        switch self {
        case .digit, .decimal:
            return  .secondary                   
        case .operation, .equal:
            return Color.orange.opacity(0.8)
        case .clear,.allClear, .negative, .percent :
            return Color(uiColor: .lightGray)
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .clear,.allClear, .negative, .percent:
            return .black
        default:
            return .white
        }
    }
    
    var format: String {
        switch self {
        case .digit, .clear, .allClear, .decimal:
            return "string"
        default: // case .operation, .equal, .percent, .negative:
            return "image"
        }
    }
    
}
