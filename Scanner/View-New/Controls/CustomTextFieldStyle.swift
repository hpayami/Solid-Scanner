//
// Copyright © 1402 AP Hossein Payami. All rights reserved.
// 

import Foundation
import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding()
            .background(Color(red: 0.97, green: 0.97, blue: 0.98))
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).inset(by: 0.50).stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 0.50))
    }
}

