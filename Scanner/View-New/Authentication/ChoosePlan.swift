//
// Copyright © 1402 AP Hossein Payami. All rights reserved.
// 

import SwiftUI

struct ChoosePlan: View {

        var body: some View {
            NavigationView(content: {
                VStack {
                    VStack {
                        TopButton()

                        HStack {
                            Text("Choose your plan")
                                .font(Font.custom("Asap", size: 30).weight(.bold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.17))
                        }
                        .padding(.horizontal, 22)
                        .padding(.bottom, 5)

                        HStack {
                            Text("To complete the sign up process, please make the payment")
                                .font(Font.custom("Asap", size: 16).weight(.medium))
                                .lineSpacing(4)
                                .foregroundColor(Color(red: 0.51, green: 0.57, blue: 0.63))
                        }
                    }
                    .padding()

                VStack {
                    PlanView(typePlan: "Mounthly",pricePlan: 29.99,typeTotalPlan: 0,typeYear: "mo")
                    PlanView(typePlan: "Annual",pricePlan: 15.99,typeTotalPlan: 0,typeYear: "mo ($192 / year)")
                    PlanView(typePlan: "Free trial",pricePlan: 0,typeTotalPlan: 0,typeYear: "1 month free")
                    Spacer()
                        HStack {

                            NavigationLink(destination: ChoosePlan()) { Text("Purchase")
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
    ChoosePlan()
}

struct PlanView: View {
     var typePlan: String = ""
     var pricePlan: Double = 0
     var typeTotalPlan: Double = 0
     var typeYear: String = ""
     var selectedPayment:String = ""

     var body: some View {
         Button(action: {
             if typePlan == "Mounthly" {
                 print("Mounthly")
             } else if typePlan == "Annual" {
                 print("Annual")
             } else if typePlan == "Free trial" {
                 print("Free trial")
             }
         }, label: {
             VStack(spacing: 8){

                 HStack{

                     Text("\(typePlan)")
                         .font(.custom("Asap", size: 20))
                         .foregroundColor(.black)
                         .padding(.horizontal)
                     Spacer()
                 }
                 HStack{

                     Text("$"+"\(pricePlan) / \(typeYear)")
                         .font(.custom("Asap", size: 18))
                         .foregroundColor(.gray)
                         .padding(.horizontal)
                     Spacer()
                 }
                 HStack{
                     Spacer()

                     Text("$"+"\(typeTotalPlan) / mo")
                         .font(.custom("Asap", size: 18))
                         .foregroundColor(.gray)
                         .padding(.horizontal)

                 }

             } .frame(width: 353, height: 84)
                 .cornerRadius(15)
                 .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .inset(by: 0.50)
                        .stroke(.black, lineWidth: 0.50)
                 )
         })

    }
}
