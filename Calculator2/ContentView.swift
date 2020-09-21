//
//  ContentView.swift
//  Calculator2
//
//  Created by 本山武文 on 2020/09/17.
//

import SwiftUI

struct LogicalButton: View {
    let button: Buttons
    
    @ViewBuilder
    var body: some View {
        switch button.rawValue {
        case 0...9:
            NumberButton(button: button)
        case 12...15:
            BinarOperatorButton(button: button)
        default:
            SpecialButton(button: button)
        }
    }
}

struct ModifiedButton: View {
    let button: Buttons
    var width = UIScreen.main.bounds.width / 4
    var height = UIScreen.main.bounds.width / 4
    

    var body: some View {
        LogicalButton(button: button)
            .font(.largeTitle)
            .frame(width: width, height: height)
            .background(Color.gray)
            .foregroundColor(.white)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 0.3)
    }
}

struct ContentView: View {
    @EnvironmentObject var calcData: CalcData
    var body: some View {
        return ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0.0) {
                Spacer()
                Text("\(calcData.numStack[0])")
                    .multilineTextAlignment(.trailing)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 4)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                HStack(spacing: 0.0) {
                    ModifiedButton(button: .clear)
                    ModifiedButton(button: .changeSign)
                    ModifiedButton(button: .percent)
                    ModifiedButton(button: .divide)
                }
                HStack(spacing: 0.0) {
                    ModifiedButton(button: .seven)
                    ModifiedButton(button: .eight)
                    ModifiedButton(button: .nine)
                    ModifiedButton(button: .multiply)
                }
                HStack(spacing: 0.0) {
                    ModifiedButton(button: .four)
                    ModifiedButton(button: .five)
                    ModifiedButton(button: .six)
                    ModifiedButton(button: .minus)
                }
                HStack(spacing: 0.0) {
                    ModifiedButton(button: .one)
                    ModifiedButton(button: .two)
                    ModifiedButton(button: .three)
                    ModifiedButton(button: .plus)
                }
                HStack(spacing: 0.0) {
                    ModifiedButton(button: .zero, width: UIScreen.main.bounds.width / 4 * 2)
                    ModifiedButton(button: .point)
                    ModifiedButton(button: .equal)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CalcData())
    }
}
