//
//  ButtonView.swift
//  CalculatorApp_SU
//
//  Created by Students on 19.03.2023.
//

import SwiftUI

struct ButtonView: View {
    
    @EnvironmentObject private var viewModel: CalculatorViewModel
    
    let button: AllButton
    var backgroundColor: Color
    var foregroundColor: Color
    
    private let padding: CGFloat = 10
    
    var body: some View {
        Button {
            viewModel.performAction(button: button)
        } label: {
            Capsule()
                .foregroundColor(backgroundColor)
                .frame(height: getButtonSize())
                .frame(maxWidth: button.description == "0" ? .infinity : getButtonSize())
                .overlay(alignment: button.description == "0" ? .leading : .center) {
                    if button.format.description == "image" {
                        Image(systemName: button.description)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(foregroundColor)
                            .padding()
                    } else {
                        Text(button.description)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(foregroundColor)
                            .padding()
                            .padding(.leading, button.description == "0" ? padding * 2 : 0)
                    }
                }
                
        }
    }
    
    private func getButtonSize() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let buttonsCount: CGFloat = 4
        let spacesCount = buttonsCount + 1
        
        let buttonSize = (screenWidth - (spacesCount * padding)) / buttonsCount
        return buttonSize
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(button: AllButton.digit(.zero), backgroundColor: .orange, foregroundColor: .white)
    }
}
