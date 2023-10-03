//
// Copyright © 1402 AP Hossein Payami. All rights reserved.
// 

import SwiftUI

struct ForgotPassword: View {


    @State private var yourEmail = ""


    var body: some View {
        NavigationView(content: {

            VStack{

                VStack{
                    TopButton()
                    HStack{
                        Text("Forgot Password?")
                            .font(Font.custom("Asap", size: 30).weight(.bold))

                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.17))
                    }.padding(.horizontal,22)
                    HStack{
                        Text("Don't worry! It occurs. Please enter the email address linked with your account.")
                            .font(Font.custom("Asap", size: 16).weight(.medium))
                            .lineSpacing(24)
                            .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63));
                    }
                }.padding()
                VStack(spacing:15){
                    HStack(content: {
                        TextField("Enter your email", text: $yourEmail)
                            .font(.custom("Asap", size: 15))
                            .bold()
                            .foregroundColor(.gray)
                            .frame(height: 56)
                            .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).inset(by: 0.50).stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 0.50))


                    }).padding([.leading,.trailing],22)



                    HStack{
                        Button(action: {

                        }) {
                            Text("Send Code")
                                .font(.custom("Asap", size: 20))

                        }
                        .buttonStyle(RoundedButtonStyle())

                    }
                    .padding(.top,30)


                    Spacer()
                    HStack{
                        Text("Remember Password?")
                            .font(
                                Font.custom("Asap", size: 15)
                                    .weight(.medium)
                            )
                            .kerning(0.15)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.14, green: 0.16, blue: 0.17))
                        NavigationLink(destination: LoginSignup()) { Text("Login")
                                .font(
                                    Font.custom("Asap", size: 15)
                                        .weight(.medium)
                                )
                                .kerning(0.15)
                                .multilineTextAlignment(.center)
                            .foregroundColor(.pink)}


                    }.padding()
                }
                Spacer()

            }
        }).navigationBarBackButtonHidden()


    }
}


#Preview {
    ForgotPassword()
}

