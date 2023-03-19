//
//  CalculatorView.swift
//  CalculatorApp_SU
//
//  Created by Students on 19.03.2023.
//

import SwiftUI

struct CalculatorView: View {
    
    @EnvironmentObject var viewModel: CalculatorViewModel
    
    private let padding: CGFloat = 10
                
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
            .environmentObject(CalculatorViewModel())
    }
}

extension CalculatorView {
    
    private var textAmount: some View {
        
        Text(viewModel.text)
            .font(.system(size: 90, weight: .light))
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
        
    }
    
    private var buttonCells: some View {
        VStack(spacing: padding) {
            ForEach(viewModel.buttons, id: \.self) { row in
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
