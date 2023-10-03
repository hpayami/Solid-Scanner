//
// Copyright © 1402 AP Hossein Payami. All rights reserved.
// 

import Foundation
import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 331, height: 56)
            .background(configuration.isPressed ? Color.blue : Color(red: 0.12, green: 0.14, blue: 0.17))
            .foregroundColor(.white)
            .cornerRadius(8)
            .shadow(radius: configuration.isPressed ? 0 : 8)
    }
}
