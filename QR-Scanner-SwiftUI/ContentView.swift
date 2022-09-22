//
//  ContentView.swift
//  QR-Scanner-SwiftUI
//
//  Created by Jonas Bergström on 2022-09-21.
//

import SwiftUI
import CodeScanner
import AVFoundation

struct ContentView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Get Started!"
    
    @State var torch = false
    
    var scannerSheet: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    CodeScannerView(
                        codeTypes: [.qr],
                        completion: { result in
                            if case let .success(code) = result {
                                self.scannedCode = code.string
                                self.isPresentingScanner = false
                            }
                        }
                    )
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    torch.toggle()
                    toggleTorch(on: torch)
                }) {
                    Text("Flash Light")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.blue)
                Spacer()
            }
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

func toggleTorch(on: Bool) {
    guard let device = AVCaptureDevice.default(for: .video) else { return }
    if device.hasTorch {
        do {
            try device.lockForConfiguration()
            
            if on == true {
                device.torchMode = .on
            } else {
                device.torchMode = .off
            }
            
            device.unlockForConfiguration()
        } catch {
            print("Torch could not be used")
        }
    } else {
        print("Torch is not available")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
