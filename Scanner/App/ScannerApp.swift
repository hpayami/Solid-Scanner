//
// Copyright © 1402 AP Hossein Payami. All rights reserved.
// 

import SwiftUI
import SwiftData

@available(iOS 17.0, *)
@main
struct ScannerApp: App {
   
    var body: some Scene {
        WindowGroup {

            SplashScreen()
         //
        }
        .modelContainer(for: [ScannedImage.self])

    }
}
