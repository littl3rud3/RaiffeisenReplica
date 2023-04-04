import SwiftUI

struct CardsAndAccounts: View {
    
    @State private var starCliked = true
    
//    private let cards = [
//        CardHStack(imageName: "raifCardMirIcon", cardName: "Цифровая карта", lastDigits: 5191, isDigital: true),
//        CardHStack(imageName: "raifCardIcon", cardName: "Cashback card"),
//    ].filter{$0.starClicked}
    
    private let cards = [""]
    
    private let accounts = [
        AccountHStack(imageName: "roubleIcon", cardName: "Цифровая карта", lastDigits: 5191),
        AccountHStack(imageName: "roubleIcon", cardName: "Cashback card", lastDigits: 5700),
    ].filter{$0.starClicked}
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 1) {

                if cards.count > 0 {
                    VStack(alignment: .leading, spacing: 1) {
                        Text("Избранные карты")
                            .font(Font.body.bold())
                            .foregroundColor(.black)
                            .padding(.bottom, 10)
                        
                        VStack {
                            CardHStack(starClicked: $starCliked, imageName: "raifCardMirIcon", cardName: "Цифровая карта", lastDigits: 5191, isDigital: true)
                            CardHStack(starClicked: $starCliked, imageName: "raifCardIcon", cardName: "Cashback card")
//                            ForEach(cards.indices, id: \.self) { index in
//                                cards[index]
//                                Divider().padding(.leading, 60)
//                            }
                        }
                    }
                    .padding()
                }

                if accounts.count > 0 {
                    VStack(alignment: .leading) {
                        Text("Избранные счета")
                            .font(Font.body.bold())
                            .foregroundColor(.black)
                            .padding(.bottom, 10)
                        
                        ForEach(accounts.indices, id: \.self) { index in
                            accounts[index]
                            Divider().padding(.leading, 60)
                        }
                    }
                    .padding()
                    .padding(.top, -10)
                }

                NavigationLink(destination: AllCardsAndAccounts(), label: {
                    HStack(alignment: .center) {
                        Text("Все счета и карты").font(.system(size: 15).bold())
                            .foregroundColor(.black)
                            .padding(.leading, 80)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 7, height: 13)
                            .font(Font.body.bold())
                            .foregroundColor(.black)
                            .padding(.trailing, 20)
                    }
                    .frame(height: 40)
                })
            }
            .background(.white)
            .cornerRadius(10)
        }
    }
}

struct CardsAndAccounts_Previews: PreviewProvider {
    static var previews: some View {
        CardsAndAccounts()
    }
}
