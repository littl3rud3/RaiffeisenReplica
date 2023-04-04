import SwiftUI

struct Tile {
    
    var imageName: String
    var text: String
}

struct FourTiles: View {
    
    var array: [Tile]
    
    var body: some View {
        ForEach(Array(stride(from: 0, to: array.count, by: 4)), id: \.self) { index in
            
            let firstElem = array[safe: index]
            let secondElem = array[safe: index + 1]
            let thirdElem = array[safe: index + 2]
            let fourthElem = array[safe: index + 3]
            
            TileHStack(
                imageName: firstElem?.imageName ?? "", text: firstElem?.text ?? "",
                secondImageName: secondElem?.imageName ?? "", secondText: secondElem?.text ?? "")
            Divider()
            if let thirdElem = thirdElem {
                TileHStack(
                    imageName: thirdElem.imageName, text: thirdElem.text,
                    secondImageName: fourthElem?.imageName ?? "", secondText: fourthElem?.text ?? ""
                )
                Divider()
            }
        }
    }
}

//struct FourTiles_Previews: PreviewProvider {
//    static var previews: some View {
//        FourTiles()
//    }
//}
