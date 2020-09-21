//
//  Calculator2App.swift
//  Calculator2
//
//  Created by 本山武文 on 2020/09/17.
//

import SwiftUI

@main
struct Calculator2App: App {
    @StateObject var calcData = CalcData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(calcData)
        }
    }
}
