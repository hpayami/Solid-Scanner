    //
    //  Login.swift
    //  Scanner
    //
    //  Created by Hossein Payami on 1402 AP.
    //  Copyright © 1402 AP Hossein Payami. All rights reserved.
    //

import SwiftUI

struct Login: View {
    var body: some View {
        NavigationView(content: {
            ZStack {

                VStack {
                    Image("Scanner_main")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.all)
                        .padding()
                    Spacer() // Move the content below the image

                    VStack(spacing: 15) {
                        NavigationLink(destination: LoginSignup()) {  Text("Login")
                                .font(.custom("Asap", size: 20))
                                .foregroundColor(.white)

                        }
                        .buttonStyle(RoundedButtonStyle())

                        NavigationLink(destination: Signup()) {  Text("Register")
                                .font(.custom("Asap", size: 20))
                                .foregroundColor(.white)

                        }
                        .buttonStyle(RoundedButtonStyle())



                        HStack {
                            NavigationLink(destination: ContentView()) {  Text("🌟 Continue as a guest")
                                    .foregroundColor(.black)
                                    .font(.custom("Asap", size: 18))
                                .fontWeight(.semibold) }




                        }
                        .padding()
                    }
                    .padding()
                }
                .padding(.bottom, 70)
            }
        })

        .navigationBarBackButtonHidden()
    }
}

 

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
