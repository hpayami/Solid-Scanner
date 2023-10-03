//
// Copyright © 1402 AP Hossein Payami. All rights reserved.
// 

import SwiftUI

struct Signup: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var username: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {

        NavigationView(content: {
            VStack {
            
                    TopButton()
                HStack{
                    Text("Hello! Register to get started")
                        .font(Font.custom("Asap", size: 30).weight(.bold))

                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.17))
                }.padding([.leading,.trailing],22)
                VStack(spacing:12){
                    TextField("Username", text: $username)
                        .textFieldStyle(CustomTextFieldStyle())
                    TextField("Email", text: $email)
                        .textFieldStyle(CustomTextFieldStyle())

                    SecureField("Password", text: $password)
                        .textFieldStyle(CustomTextFieldStyle())

                    SecureField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(CustomTextFieldStyle())



                    Button(action: {
                            // Handle registration logic here
                    }) {
                        Text("Register")
                            .font(.custom("Asap", size: 15))
                            .foregroundColor(.white)
                            .frame(width: 331, height: 56)
                            .background(Color(red: 0.12, green: 0.14, blue: 0.17))
                            .cornerRadius(8)
                    }
                }
                .padding([.leading,.trailing],22)
                VStack{
                    HStack{
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(width: 112, height: 1)
                            .overlay(
                                Rectangle()
                                    .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 0.50)
                            )
                        Text("Or Register with")
                            .font(Font.custom("Asap", size: 14).weight(.semibold))
                            .foregroundColor(Color(red: 0.42, green: 0.44, blue: 0.49))
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(width: 112, height: 1)
                            .overlay(
                                Rectangle()
                                    .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 0.50)
                            )

                    }
                    .padding(.top,44)

                    HStack{
                        Image("apple")
                            .foregroundColor(.clear)
                            .frame(width: 105, height: 56)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: 0.50)
                                    .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 0.80)
                            )
                        Image("google")
                            .foregroundColor(.blue)
                            .frame(width: 105, height: 56)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: 0.50)
                                    .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 0.80)
                            )

                    }.padding(.top,22)
                    HStack{
                        Text("Already have an account? ")
                            .font(
                                Font.custom("Asap", size: 15)
                                    .weight(.medium)
                            )
                            .kerning(0.15)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.14, green: 0.16, blue: 0.17))

                        NavigationLink(destination: LoginSignup()) { Text("Login Now")  .font(
                            Font.custom("Asap", size: 15)
                                .weight(.medium)
                        )}



                        .kerning(0.15)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.pink)
                    }.padding()
                }
            }
        })
        .navigationBarBackButtonHidden()

    }
}

#Preview {
    Signup()
}
