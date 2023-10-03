    //
    //  ChooseLanguage.swift
    //  YourApp
    //
    //  Created by Hossein Payami on 1402 AP.
    //  All rights reserved.
    //

import SwiftUI

struct ChooseLanguage: View {



    var body: some View {
        NavigationView(content: {
            VStack {
                VStack {
                  TopButton()

                    HStack {
                        Text("Choose the language")
                            .font(Font.custom("Asap", size: 30).weight(.bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.17))
                    }
                    .padding(.horizontal, 22)
                    .padding(.bottom, 5)

                    HStack {
                        Text("Don’t worry! It happens. Please enter the email associated with your account.")
                            .font(Font.custom("Asap", size: 16).weight(.medium))
                            .lineSpacing(4)
                            .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63))
                    }
                }
                .padding()

                VStack {


                        CountryList()



                    HStack {

                        NavigationLink(destination: ChoosePlan()) { Text("Continue")
                                .font(Font.custom("Asap", size: 14).weight(.semibold))

                                .buttonStyle(RoundedButtonStyle())
                        }.buttonStyle(RoundedButtonStyle())


                    }
                    .padding(.top, 40)
                }
                Spacer()
            }
        })
        .navigationBarBackButtonHidden()

    }
}


#Preview {
    ChooseLanguage()
}


#Preview {

    CountryList()
}


func countryFlag(_ countryCode: String) -> String {
    String(String.UnicodeScalarView(countryCode.unicodeScalars.compactMap {
        UnicodeScalar(127397 + $0.value)
    }))
}
struct CountryList: View {
    var body: some View {
        List(NSLocale.isoCountryCodes, id: \.self) { countryCode in
            HStack {
                Text(countryFlag(countryCode))
                Text(Locale.current.localizedString(forRegionCode: countryCode) ?? "")
                Spacer()
                //Text(countryCode)
            }

        }
        .listStyle(.sidebar)
        .scaledToFill()
    }
    }
