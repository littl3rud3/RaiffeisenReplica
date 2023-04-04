import SwiftUI

struct NewProduct: View {
    var body: some View {
        ZStack {
            Color.white.cornerRadius(15).offset(y: 20).shadow(radius: 20)
                .frame(width: 400)
            Color.white.cornerRadius(15).offset(y: 10).shadow(radius: 20)
                .frame(width: 420)

            HStack {
                ZStack {
                    Circle()
                        .strokeBorder(.yellow, lineWidth: 2)
                        .frame(width: 50, height: 50)
                        .background(Circle().strokeBorder(.black, lineWidth: 5))
                        .foregroundColor(.clear)
                    Image(systemName: "plus")
                }
                .padding(.leading, 15)

                Text("Новый продукт")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    .padding(.leading, 10)
            }
            .background(.white)
            .cornerRadius(10)
            .shadow(radius: 20)
        }
    }
}

struct NewProduct_Previews: PreviewProvider {
    static var previews: some View {
        NewProduct()
    }
}
