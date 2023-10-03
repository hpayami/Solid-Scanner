//
// Copyright © 1402 AP Hossein Payami. All rights reserved.
// 

import SwiftUI

struct OTPVerification: View {
    @State private var yourCode1 = ""
    @State private var yourCode2 = ""
    @State private var yourCode3 = ""
    @State private var yourCode4 = ""

    var body: some View {
        VStack {
            TopButton()
            VStack(spacing: 15) {
                Text("OTP Verification?")
                    .font(.custom("Asap", size: 30).weight(.bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.17))
                    .padding(.horizontal, 22)

                Text("Don't worry! It happens. Please enter the email address linked with your account.")
                    .font(.custom("Asap", size: 16).weight(.medium))
                    .lineSpacing(24)
                    .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63))
                    .padding()

                HStack(spacing: 10) {
                    ForEach(0..<4, id: \.self) { index in
                        TextField("", text: binding(for: index))
                            .font(.custom("Asap", size: 35).weight(.bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .frame(width: 56, height: 56) // Set a fixed width
                            .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: 0.50)
                                    .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 0.50)
                            )
                            .textFieldLimit(1, text: binding(for: index)) // Limit input to a single character
                    }
                }
                .padding([.leading, .trailing], 22)

                Button(action: {
                        // Handle verification logic here
                }) {
                    Text("Verify")
                        .font(.custom("Asap", size: 20))
                }
                .buttonStyle(RoundedButtonStyle())
                .padding(.top, 30)

                Spacer()

                HStack {
                    Text("Didn't receive the code?")
                        .font(Font.custom("Asap", size: 15).weight(.medium))
                        .kerning(0.15)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.14, green: 0.16, blue: 0.17))

                    Button(action: {
                            // Handle resend code logic here
                    }) {
                        Text("Resend")
                            .font(Font.custom("Asap", size: 15).weight(.medium))
                            .kerning(0.15)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.pink)
                    }
                }
                .padding()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func binding(for index: Int) -> Binding<String> {
        let text = Binding(
            get: { self.getCode(for: index) },
            set: { self.setCode($0, for: index) }
        )
        return text
    }

    private func getCode(for index: Int) -> String {
        switch index {
            case 0:
                return yourCode1
            case 1:
                return yourCode2
            case 2:
                return yourCode3
            case 3:
                return yourCode4
            default:
                return ""
        }
    }

    private func setCode(_ value: String, for index: Int) {
        switch index {
            case 0:
                yourCode1 = value
            case 1:
                yourCode2 = value
            case 2:
                yourCode3 = value
            case 3:
                yourCode4 = value
            default:
                break
        }
    }
}

#Preview {
    OTPVerification()
}
