import SwiftUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    @StateObject private var viewModel = BarcodeScannerViewModel()
    var body: some View {


        NavigationView(content: {

            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()

                VStack {
                    VStack {
                        Image("Scanner_main")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 290, height: 290)
                            .padding([.top, .trailing, .leading], 43.5)
                    }
                    .padding(.top, 45.5)

                    VStack {
                        Text("Scan Everywhere")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .padding(.bottom, 15)

                        Text("Scan documents everywhere \n everytime from your pocket.")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 12))
                            .font(.title2)
                            .lineLimit(2)
                            .lineSpacing(5)

                        Spacer().frame(height: 78)
                        Spacer()

                        HStack {
                                //

                            NavigationLink(destination: BarcodeScannerView(viewModel: viewModel)) {
                                Label(
                                    title: {
                                        Spacer()
                                        Text("NEXT")
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                            .scaledToFit()
                                    },
                                    icon: {
                                        Image("ArrowRight")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                    }
                                )
                            }


                            .frame(width: 342, height: 46)
                                .background(Color.blue)
                                .cornerRadius(radius: 10, corners: .allCorners)
                        }.padding()
                    }
                }
            }
        })
        .navigationBarBackButtonHidden()


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

 
