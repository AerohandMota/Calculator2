//
//  Buttons.swift
//  Calculator2
//
//  Created by 本山武文 on 2020/09/17.
//

import Foundation
import SwiftUI
import Combine

enum Buttons: Int {
    case zero = 0, one, two, three, four, five, six, seven, eight, nine // 0...9
    case percent, changeSign                                            // 10...11
    case plus, minus, multiply, divide                                  // 12...15
    case equal, clear, point                                            // 16...18
}


class CalcData: ObservableObject {
    @Published var currentCode: Buttons = .zero
    @Published var numStack: [Double] = [0, 0]
    @Published var codeStack: Buttons?
    @Published var pointMode: Bool = false
    @Published var pointCounter: Int = 1
    @Published var memory: Double?
    @Published var cleared: Bool = true
    let systemImg: [Buttons: String] = [.percent: "percent", .changeSign: "plus.slash.minus", .plus: "plus", .minus: "minus", .multiply: "multiply", .divide: "divide", .equal: "equal"]
    
    func initialize() {
        currentCode = .zero
        numStack = [0, 0]
        codeStack = nil
        pointMode = false
        pointCounter = 1
        memory = nil
        cleared = true
    }
}

extension View {
    func isClearable(_ button: Buttons) -> Bool {
        switch button {
        case .percent, .changeSign, .equal:
            return true
        default:
            return false
        }
    }
    func isNum(_ button: Buttons) -> Bool {
        switch button {
        case .plus, .minus, .multiply, .divide:
            return false
        default:
            return true
        }
    }
    func calc(_ ope: Buttons, _ x: Double, _ y: Double) -> Double {
        switch ope {
        case .plus:
            return x + y
        case .minus:
            return x - y
        case .multiply:
            return x * y
        case .divide where y != 0:
            return x / y
        default:
            return 999999
        }
    }
}

extension Binding where Value == Double {
    func doubleToStrDef(_ def: Double) -> Binding<String> {
        return Binding<String>(get: {
            return String(self.wrappedValue)
        }) { value in
            self.wrappedValue = Double(value) ?? def
        }
    }
}
