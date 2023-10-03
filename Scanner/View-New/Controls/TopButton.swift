//
// Copyright © 1402 AP Hossein Payami. All rights reserved.
// 

import Foundation
import SwiftUI
import SwiftData

struct TopButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        HStack{
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image("back")
                    .frame(width:41,height: 41)
            }

            Spacer()
        }.padding()
    }
}
