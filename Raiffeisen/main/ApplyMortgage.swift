import SwiftUI

struct ApplyMortgage: View {
    var body: some View {
        HStack(spacing: 20) {
            
            Image("mortgageIcon")
                .resizable()
                .frame(width: 30, height: 30)
                .background(Color(uiColor: #colorLiteral(red: 0.9953590035, green: 0.9002656341, blue: 0, alpha: 1)).frame(width: 50, height: 50).cornerRadius(30))
                .padding(.leading, 30)
            
            Text("Оформить ипотеку")
                .background()
                .font(.system(size: 20, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 70)
        .background(.white)
        .cornerRadius(15)
    }
}

struct ApplyMortgage_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().background(.gray)
    }
}
