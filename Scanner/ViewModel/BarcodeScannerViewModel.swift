//
// Copyright © 1402 AP Hossein Payami. All rights reserved.
// 

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    @Published var isTorchOn = false

}
