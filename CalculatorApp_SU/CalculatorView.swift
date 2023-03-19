//
//  CalculatorView.swift
//  CalculatorApp_SU
//
//  Created by Students on 19.03.2023.
//

import SwiftUI

struct CalculatorView: View {
    private let padding: CGFloat = 10
    
    let result = 1_514.02
    
    var buttons: [[AllButton]] {
            [[.allClear, .negative, .percent, .operation(.division)],
             [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiplication)],
             [.digit(.four), .digit(.five), .digit(.six), .operation(.subtraction)],
             [.digit(.one), .digit(.two), .digit(.three), .operation(.addition)],
             [.digit(.zero), .decimal, .equal]]
        }
    
    let size: CGFloat = 60
    
    var body: some View {
        VStack {
            Spacer()
            textAmount
            buttonCells
        }
        .padding(padding)
        .background(Color.black)
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

extension CalculatorView {
    
    private var textAmount: some View {
        
        Text("\(result)")
            .font(.system(size: 90, weight: .light))
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
        
    }
    
    private var buttonCells: some View {
        VStack(spacing: padding) {
              ForEach(buttons, id: \.self) { row in
                  HStack(spacing: padding) {
                      ForEach(row, id: \.self) { cell in
                          ButtonView(button: cell,
                                     backgroundColor: cell.backgroundColor,
                                     foregroundColor: cell.foregroundColor)
                          
                      }
                  }
              }
          }
    }
    
}
