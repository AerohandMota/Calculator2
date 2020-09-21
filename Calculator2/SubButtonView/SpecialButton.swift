//
//  SpecialButton.swift
//  Calculator2
//
//  Created by 本山武文 on 2020/09/18.
//

import SwiftUI

struct SpecialButton: View {
    @EnvironmentObject var calcData: CalcData
    var button: Buttons
    
    @ViewBuilder
    var body: some View {
        switch button {
        case .equal:
            Button(action: {
                let ope = calcData.codeStack
                if ope != nil {
                    if isNum(calcData.currentCode) && calcData.currentCode != .equal {
                        let save = calcData.numStack.remove(at: 0)
                        calcData.numStack[0] = calc(ope!, calcData.numStack[0], save)
                        calcData.codeStack = nil
                    } else {
                        calcData.memory = calcData.memory ?? calcData.numStack[0]
                        calcData.numStack[0] = calc(ope!, calcData.numStack[0], calcData.memory!)
                    }
                }
                calcData.currentCode = button
                calcData.pointMode = false
            }, label: {
                Image(systemName: calcData.systemImg[button]!)
            })
        case .percent:
            Button(action: {
                if isNum(calcData.currentCode) {
                    calcData.numStack[0] /= 100
                    calcData.currentCode = button
                }
                calcData.pointMode = false
            }, label: {
                Image(systemName: calcData.systemImg[button]!)
            })
        case .changeSign:
            Button(action: {
                if isNum(calcData.currentCode) {
                    calcData.numStack[0] *= -1
                    calcData.currentCode = button
                }
                calcData.pointMode = false
            }, label: {
                Image(systemName: calcData.systemImg[button]!)
            })
        case .clear:
            Button(action: {
                calcData.initialize()
            }, label: {
                if calcData.cleared {
                    Text("AC")
                } else {
                    Text("C")
                }
            })
        case .point:
            Button(action: {
                if isClearable(button) {
                    calcData.initialize()
                }
                calcData.pointMode = true
                calcData.cleared = false
            }, label: {
                Text(" .")
            })
        default:
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
    }
}

struct SpecialButton_Previews: PreviewProvider {
    static var previews: some View {
        SpecialButton(button: .equal)
    }
}
