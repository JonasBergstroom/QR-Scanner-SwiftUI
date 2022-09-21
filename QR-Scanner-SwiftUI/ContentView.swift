//
//  ContentView.swift
//  QR-Scanner-SwiftUI
//
//  Created by Jonas Bergström on 2022-09-21.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Get Started!"
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
