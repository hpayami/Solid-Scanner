//
// Copyright © 1402 AP Hossein Payami. All rights reserved.
// 

import SwiftUI


#Preview {
    ResetPassword()
}
    struct ResetPassword: View {
        @State private var yourCode1 = ""
        @State private var yourCode2 = ""
        @State private var yourCode3 = ""
        @State private var yourCode4 = ""
        @State private var overallCode = ""
        var body: some View {
            NavigationView(content: {
                VStack{

                    VStack{

                            TopButton()
                        HStack{
                            Text("Create new password")
                                .font(Font.custom("Asap", size: 30).weight(.bold))

                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.17))
                        }.padding([.trailing,.leading],22)
                            .padding(.bottom,2)
                        HStack{
                            Text("Your new password must be unique from those previously used.")
                                .font(Font.custom("Asap", size: 16).weight(.medium))
                                .lineSpacing(6)
                                .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63));
                        }
                    }.padding()
                    VStack(spacing:15){
                        VStack(content: {
                            TextField("New Password", text: $yourCode1)
                                .font(.custom("Asap", size: 15))
                                .bold()
                                .foregroundColor(.gray)
                                .frame(height: 56)
                                .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                                .cornerRadius(8)
                                .overlay(RoundedRectangle(cornerRadius: 8).inset(by: 0.50).stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 0.50))
                            TextField("confirm Password", text: $yourCode2)
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
                                Text("Reset Password")
                                    .font(.custom("Asap", size: 20))
                            }
                            .buttonStyle(RoundedButtonStyle())

                        }
                        .padding(.top,30)


                        Spacer()

                    }
                    Spacer()

                }
            }
            ).navigationBarBackButtonHidden()

        }
}
