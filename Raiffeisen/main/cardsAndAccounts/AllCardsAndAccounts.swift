import SwiftUI

struct AllCardsAndAccounts: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var starClicked = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                Constants.BACKGROUND.ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    
                    Text("Карты").bold().padding()
                    
                    VStack {
                        NavigationLink {
                            CardDetails()
                        } label: {
                            CardHStack(starClicked: $starClicked, imageName: "raifCardMirIcon", cardName: "Цифровая карта", lastDigits: 5191, isDigital: true, showStar: true)
                        }
                        .buttonStyle(.plain)

                        Divider().padding(.leading, 60)
                        
                        CardHStack(starClicked: $starClicked, imageName: "raifCardIcon", cardName: "Cashback card", showStar: true).padding(.top, 10)
                        
                        Divider().padding(.leading, 60)
                    }
                    
                    Text("Счета").padding().bold()
                    
                    VStack {
                        AccountHStack(imageName: "roubleIcon", cardName: "Цифровая карта", lastDigits: 5191, showStar: true)
                        
                        Divider().padding(.leading, 60)
                        
                        AccountHStack(imageName: "roubleIcon", cardName: "Cashback card", lastDigits: 5700, showStar: true)
                        
                        Divider().padding(.leading, 60)
                    }
                    Spacer()
                }.background(.white).cornerRadius(10).ignoresSafeArea().padding(.top)
//                .cornerRadius(50)
//                .frame(maxWidth: .infinity)
//                .background(.yellow)
//                .padding()
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Constants.BACK_BUTTON()
                            .onTapGesture {
                                dismiss()
                            }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text("Все счета и карты").foregroundColor(.white).font(Font.body.bold())
                    }
                }
                .toolbarBackground(Constants.BACKGROUND, for: .navigationBar)
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.visible, for: .navigationBar)
            }
        }        .navigationBarBackButtonHidden(true)
            .background(Constants.BACKGROUND)
            
    }
}

struct AllCardsAndAccounts_Previews: PreviewProvider {
    static var previews: some View {
        AllCardsAndAccounts()
    }
}
