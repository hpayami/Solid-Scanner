    //
    // Copyright © 1402 AP Hossein Payami. All rights reserved.
    //

import SwiftUI


struct LoginSignup: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var yourEmail = ""
    @State private var yourPassword = ""
    @State private var showPassword = false
    var body: some View {
        NavigationView(content: {
        ZStack{
            VStack{
                
                    TopButton()
                HStack{
                    Text("Welcome back! \nGlad to see you, Again!")
                        .font(Font.custom("Asap", size: 30).weight(.bold))

                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.17))
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
                    HStack(content: {
                        SecureField("Enter your password", text: $yourPassword)
                            .font(.custom("Asap", size: 15))
                            .bold()
                            .foregroundColor(.gray)
                            .frame(height: 56)
                            .background(Color(red: 0.97, green: 0.97, blue: 0.98))
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).inset(by: 0.50).stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 0.50))
                            .overlay(
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        showPassword.toggle()
                                    }) {
                                        Image(systemName: showPassword ? "eye" : "eye.slash")
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.trailing, 10)
                                }
                            )



                    }).padding([.leading,.trailing],22)
                    HStack{
                        Spacer()

                        NavigationLink(destination: ForgotPassword()) { Text("Forgot Password?")
                                .font(Font.custom("Asap", size: 14).weight(.semibold))
                            .foregroundColor(.pink)}



                    }
                    .padding(.trailing,22)
                    HStack{
                        Button(action: {

                        }) {
                            Text("Login")
                                .font(.custom("Asap", size: 20))

                        }
                        .buttonStyle(RoundedButtonStyle())

                    }
                    .padding(.top,30)
                    HStack{
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(width: 112, height: 1)
                            .overlay(
                                Rectangle()
                                    .stroke(Color(red: 0.91, green: 0.93, blue: 0.96), lineWidth: 0.50)
                            )
                        Text("Or Login with")
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
                        Text("Don’t have an account? ")
                            .font(
                                Font.custom("Asap", size: 15)
                                    .weight(.medium)
                            )
                            .kerning(0.15)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.14, green: 0.16, blue: 0.17))

                        NavigationLink(destination: Signup()) { Text("Register Now")
                                .font(Font.custom("Asap", size: 14).weight(.semibold))
                            .foregroundColor(.pink)}

                    }.padding()
                }
                Spacer()
            }
        }
    } ).navigationBarBackButtonHidden()
    }
}








   





 

#Preview {
    LoginSignup()
}
