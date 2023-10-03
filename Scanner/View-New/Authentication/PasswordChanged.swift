//
// Copyright © 1402 AP Hossein Payami. All rights reserved.
// 

import SwiftUI

struct PasswordChanged: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView(content: {


            VStack {
                Spacer()
                VStack{
                    Image("Successmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)

                        .frame(width: 100, height: 100)


                }.padding(.bottom,30)

                HStack{
                    NavigationLink {
                        LoginSignup()
                    } label: {
                        Text("Back to Login")
                            .font(Font.custom("Asap", size: 15).weight(.semibold))
                            .foregroundColor(.white)
                    }



                }



                VStack() {
                    Text("Password Changed!")
                        .font(Font.custom("Asap", size: 26).weight(.bold))
                        .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.17))

                        .padding(.bottom,5)
                    Text("Your password has been changed \nsuccessfully.")
                        .font(Font.custom("Asap", size: 15).weight(.medium))
                        .lineSpacing(6)
                        .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63))

                        .multilineTextAlignment(.center)
                }
                .padding()


                HStack{
                    Button(action: {
                            // ✨ Add the mystical registration action here
                    }) {
                        Text("Back to Login")
                            .font(.custom("Asap", size: 20))

                    }
                    .buttonStyle(RoundedButtonStyle())

                }

                Spacer()
            }
        }).navigationBarBackButtonHidden()



    }
}



#Preview {
    PasswordChanged()
}
