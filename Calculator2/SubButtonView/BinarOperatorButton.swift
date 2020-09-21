//
//  BinarOperatorButton.swift
//  Calculator2
//
//  Created by 本山武文 on 2020/09/18.
//

import SwiftUI

struct BinarOperatorButton: View {
    var button: Buttons
    @EnvironmentObject var calcData: CalcData
    var body: some View {
        Button(action: {
            if isNum(calcData.currentCode) {
                if let preOpe = calcData.codeStack {
                    let save = calcData.numStack.remove(at: 0)
                    calcData.numStack[0] = calc(preOpe, calcData.numStack[0], save) // 0 divideのerror handling
                }
                calcData.codeStack = button
            }
            calcData.currentCode = button
            calcData.pointMode = false
        }, label: {
            Image(systemName: calcData.systemImg[button]!)
        })
    }
}

struct BinarOperatorButton_Previews: PreviewProvider {
    static var previews: some View {
        BinarOperatorButton(button: .plus)
    }
}
