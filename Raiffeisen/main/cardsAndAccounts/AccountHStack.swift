import SwiftUI

struct AccountHStack: View {
    @State var starClicked = true
    
    var imageName: String
    var cardName: String
    var lastDigits: Int
    var showStar = false
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 10) {
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.top, -10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Текущий счет").font(.system(size: 15))
                
                Text("\(cardName), *\(String(lastDigits))")
                    .foregroundColor(.gray)
                    .font(.system(size: 13))
            }
            
            Spacer()
            
            BalanceVStack(roubleBalance: 0, showCashback: false)
            
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

struct AccountHStack_Previews: PreviewProvider {
    static var previews: some View {
        AccountHStack(imageName: "roubleIcon", cardName: "Цифровая карта", lastDigits: 5191, showStar: true)
    }
}
