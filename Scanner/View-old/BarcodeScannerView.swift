    //
    // Copyright © 1402 AP Hossein Payami. All rights reserved.
    //

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input", message: "Something is wrong with the camera. We are unable to capture the input.", dismissButton: .default(Text("OK")))
    static let invalidScannedType = AlertItem(title: "Invalid Scanned Tyoe", message: "The calue scanned is not valid. This app scans EAN-8 and EAN-13.", dismissButton: .default(Text("OK")))
}
struct BarcodeScannerView: View {
    @StateObject var viewModel = BarcodeScannerViewModel()

    var body: some View {
        NavigationView {
            GeometryReader { geometry in


                VStack{
                    ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem, isTorchOn:$viewModel.isTorchOn )

                        .frame(maxWidth: .infinity, maxHeight: .infinity)

                                        Spacer()
                                            .frame(height: 60)

                    VStack{
                        Label("Scanned Barcode:",systemImage: "barcode.viewfinder")
                            .font(.title)

                        Text(viewModel.scannedCode.isEmpty ? "Not Yet Scanned" : viewModel.scannedCode)
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(viewModel.scannedCode.isEmpty ? .red : .green)
                            .padding()
                    }
                }
                .edgesIgnoringSafeArea(.all)
                    // Rectangle mask






            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
                // Lock the orientation to portrait
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
        .onDisappear {
                // Restore the supported orientations
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }
}


#Preview {
    BarcodeScannerView()

}
