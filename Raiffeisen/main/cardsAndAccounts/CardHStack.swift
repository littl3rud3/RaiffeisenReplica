import SwiftUI

struct CardHStack: View {

    @Binding var starClicked: Bool

    var imageName: String
    var cardName: String
    var lastDigits = 0
    var isDigital = false
    var showStar = false

    var body: some View {

        HStack(alignment: .top, spacing: 10) {
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(cardName).font(.system(size: 15))
                
                if isDigital {
                    HStack {
                        Image("cloudIcon")
                            .resizable()
                            .frame(width: 15, height: 12)
                        Text("*\(String(lastDigits))")
                            .foregroundColor(.gray)
                            .font(.system(size: 13))
                    }
                }
                Text("Кэшбэк за \(CalendarUtil.currentMonth)")
                    .foregroundColor(.gray)
                    .font(.system(size: 13))
                    .padding(.top, 10)
            }
            
            Spacer()
            
            BalanceVStack(roubleBalance: 0, cashbackBalance: 6, showCashback: true)
            
            if showStar {
                if !starClicked {
                    Image(systemName: "star")
                        .onTapGesture {
                            starClicked.toggle()
                        }
                } else {
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                        .onTapGesture {
                            starClicked.toggle()
                        }
                }
            }
        }
    }
}

//struct Cards_Previews: PreviewProvider {
//    static var previews: some View {
//        CardHStack(imageName: "raifCardMirIcon", cardName: "Цифровая карта", lastDigits: 5191,
//            isDigital: false, showStar: true)
//    }
//}
