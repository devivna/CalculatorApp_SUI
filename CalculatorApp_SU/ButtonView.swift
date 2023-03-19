//
//  ButtonView.swift
//  CalculatorApp_SU
//
//  Created by Students on 19.03.2023.
//

import SwiftUI

struct ButtonView: View {
    
    var button: AllButton
    var backgroundColor: Color
    var foregroundColor: Color
    
    private let padding: CGFloat = 10
    
    var body: some View {
        Button {
            //
        } label: {
            Circle()
                .foregroundColor(backgroundColor)
                .frame(width: getButtonSize())
                .overlay {
                    if button.format.description == "image" {
                        Image(systemName: button.description)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(foregroundColor)
                            .padding()
                    } else {
                        Text(button.description)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(foregroundColor)
                            .padding()
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
        ButtonView(button: AllButton.digit(.eight), backgroundColor: .orange, foregroundColor: .white)
    }
}
