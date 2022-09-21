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
    
    
    var scannerSheet: some View {
        ZStack {
            
        }
    }

    var body: some View {
        VStack(spacing: 10) {
            Text(scannedCode)
                .aspectRatio(1, contentMode: .fit)
                .padding()
            Button("Scan a new QR-Code") {
                self.isPresentingScanner = true
            }
            .fullScreenCover(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
