////
// //Copyright © 1402 AP Hossein Payami. All rights reserved.
////
//
//import Foundation
//import SwiftUI
//
//struct ScannerView: UIViewControllerRepresentable{
//    @Binding var scannedCode: String
//    @Binding var alertItem: AlertItem?
//
//   func makeUIViewController(context: Context) -> ScannerVC {
//      ScannerVC(scannerDelegate: context.coordinator)
//    }
//
//    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(scannerView: self)
//    }
//
//    final class Coordinator: NSObject, ScannerVCDelegate {
//        private let scannerView: ScannerView
//
//        init(scannerView: ScannerView) {
//            self.scannerView = scannerView
//        }
//
//        func didFind(barcode: String) {
//            scannerView.scannedCode = barcode
//        }
//
//        func didSurface(error: CameraError) {
//            switch error {
//                case .invalidDeviceInput:
//                    scannerView.alertItem = AlertContext.invalidDeviceInput
//
//                case .invalidScannedValue:
//                    scannerView.alertItem = AlertContext.invalidScannedType
//            }
//        }
//    }
//
//}
//struct ScannerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScannerView(scannedCode: .constant("1234567"), alertItem: )
//    }
//}
import SwiftUI
import AVFoundation
import MRZScanner

struct ScannerView: UIViewControllerRepresentable {
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    @Binding var isTorchOn: Bool // To toggle the torch on/off

    func makeUIViewController(context: Context) -> ScannerVC {
        let scannerVC = ScannerVC(scannerDelegate: context.coordinator)
        scannerVC.scannerView = self
        return scannerVC
    }

    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }

    final class Coordinator: NSObject, ScannerVCDelegate {


        private let scannerView: ScannerView

        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }

        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }

        func didSurface(error: CameraError) {
            switch error {
                case .invalidDeviceInput:
                    scannerView.alertItem = AlertContext.invalidDeviceInput

                case .invalidScannedValue:
                    scannerView.alertItem = AlertContext.invalidScannedType
            }
        }
        func didToggleTorch(isOn: Bool) {
            scannerView.isTorchOn = isOn
        }

    }
}
