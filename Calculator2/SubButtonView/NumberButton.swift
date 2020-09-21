//
//  NumberButton.swift
//  Calculator2
//
//  Created by 本山武文 on 2020/09/17.
//

import SwiftUI

struct NumberButton: View {
    @EnvironmentObject var calcData: CalcData
    var button: Buttons
    
    var body: some View {
        Button(action: {
            if isClearable(calcData.currentCode) {
                calcData.initialize()
                calcData.numStack[0] = Double(button.rawValue)
            } else if isNum(calcData.currentCode) {
                if calcData.pointMode {
                    calcData.numStack[0] += Double(button.rawValue) * pow(10, -Double(calcData.pointCounter))
                    calcData.pointCounter += 1
                } else {
                    calcData.numStack[0] = calcData.numStack[0] * 10 + Double(button.rawValue)
                }
            } else {
                calcData.numStack.insert(Double(button.rawValue), at: 0)
            }
            calcData.currentCode = button
            if !(calcData.cleared && calcData.currentCode == .zero) {
                calcData.cleared = false
            }
        }, label: {
            Text("\(button.rawValue)")
        })
    }
}

struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        NumberButton(button: .zero)
    }
}
