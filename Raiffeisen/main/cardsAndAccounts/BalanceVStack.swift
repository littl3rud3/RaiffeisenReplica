import SwiftUI

struct BalanceVStack: View {
    
    var roubleBalance: Double
    var cashbackBalance = 0.0
    var showCashback: Bool
    
    var body: some View {
        VStack {
            roubleBalance.smallDecimal(font: 13).bold()
                .foregroundColor(.black).font(Font.body.bold())
            
            if showCashback {
                cashbackBalance.smallDecimal(font: 12)
                    .foregroundColor(.gray).padding(.top, 5)
                    .font(.system(size: 13))
            }
        }
    }
}

struct BalanceVStack_Previews: PreviewProvider {
    static var previews: some View {
        BalanceVStack(roubleBalance: 0, cashbackBalance: 6, showCashback: true)
    }
}
