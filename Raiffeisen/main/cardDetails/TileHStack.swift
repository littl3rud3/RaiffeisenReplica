import SwiftUI

struct TileHStack: View {
    
    var imageName: String
    var text: String
    
    var secondImageName: String
    var secondText: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Image(imageName)
                Text(text).lineLimit(2, reservesSpace: true).font(.system(size: 15))
            }
            .padding(.top)
            .padding(.leading)
            .frame(maxWidth: .infinity, maxHeight: 90, alignment: .leading)
            Divider()
            VStack(alignment: .leading) {
                Image(secondImageName)
                Text(secondText).lineLimit(2, reservesSpace: true).font(.system(size: 15))
            }
            .padding(.top)
            .padding(.leading)
            .frame(maxWidth: .infinity, maxHeight: 90, alignment: .leading)
        }
    }
}

struct TileHStack_Previews: PreviewProvider {
    static var previews: some View {
        CardDetails()
    }
}
