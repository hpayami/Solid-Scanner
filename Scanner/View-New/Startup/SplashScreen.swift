//
// Copyright © 1402 AP Hossein Payami. All rights reserved.
// 

import SwiftUI

struct SplashScreen: View {
    @State var isActive: Bool = false
    var body: some View {
        ZStack{
            if self.isActive {
                //OTPVerification()
                    //ContentView()
            /*ChooseLanguage*/
                Login()
            } else {

            VStack{
                Spacer()
                VStack{
                    Spacer()
                    Image("MainIcon")
                        .padding(.bottom, 2)
                    Text("Scanner")
                        .font(.system(size: 12))
                        .padding(.bottom, 2)
                    Text("Developer: Hossein Payami")
                        .font(.system(size: 12))
                        .padding(.bottom, 2)
                    Text("Ver 1.0")
                        .font(.system(size: 8))
                        .padding(.bottom, 2)
                    Spacer()
                }
                Spacer()

            }
        }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation {
                    self.isActive = true
                }
            }
        }

    }
}

#Preview {
    SplashScreen()
}




 
