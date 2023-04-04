import SwiftUI

struct AdvertOffer: View {
    var body: some View {
        Image("creditOffer")
            .resizable()
            .frame(height: 120)
            .padding(.leading, -20)
            .padding(.trailing, -20)
            .overlay(alignment: .topTrailing) {
                Image(systemName: "xmark.circle.fill")
                    .resizeToIcon()
                    .foregroundColor(.white)
                    .padding()
                    .offset(x: 7)
            }
    }
}

struct AdvertOffer_Previews: PreviewProvider {
    static var previews: some View {
        AdvertOffer().background(.black)
    }
}
