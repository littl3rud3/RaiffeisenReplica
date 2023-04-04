import SwiftUI

struct SectionStack: View {

    let imageName: String
    let systemImageName: String
    let firstLine: String
    let secondLine: String
    let showButton: Bool

    init(
        imageName: String = "", systemImageName: String = "", firstLine: String,
        secondLine: String = "", showButton: Bool = false
    ) {
        self.imageName = imageName
        self.systemImageName = systemImageName
        self.firstLine = firstLine
        self.secondLine = secondLine
        self.showButton = showButton
    }
    
    private let backgroundCircle: some View = {
        Circle()
            .strokeBorder(.yellow, lineWidth: 2)
            .frame(width: 45, height: 45)
            .background(Circle().strokeBorder(.black, lineWidth: 4))
            .foregroundColor(.clear)
    }()

    var body: some View {
        HStack(spacing: 40) {

            if systemImageName.isEmpty {

                Image(imageName)
                    .resizeToIcon()
                    .background(backgroundCircle)
                    .padding(.leading, 50)
            } else {
                Image(systemName: systemImageName)
                    .resizeToIcon()
                    .background(backgroundCircle)
                    .padding(.leading, 50)
            }

            if secondLine.isEmpty {

                firstLineText(text: firstLine)
                    .offset(x: -10)
            } else {

                VStack(alignment: .leading) {
                    firstLineText(text: firstLine)
                    Text(secondLine).foregroundColor(.gray).font(.system(size: 13))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(x: -10)
            }
            
            if showButton {
                
                Button(action: {}) {
                    Text("Новинка")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                        .background(Color(uiColor: #colorLiteral(red: 0.9953590035, green: 0.9002656341, blue: 0, alpha: 1)).cornerRadius(15).frame(width: 90, height: 30))
                }
                .buttonStyle(.plain)
                .padding(.trailing, 10)
            }

        }
        .frame(minHeight: 65, alignment: .leading)
        .offset(x: -20)
        .background(.white)
        .cornerRadius(10)
    }
    
    private func firstLineText(text: String) -> some View {
        Text(text)
            .font(.system(size: 16))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SectionStack_Previews: PreviewProvider {
    static var previews: some View {
        SectionStack(systemImageName: "plus", firstLine: "Новый продукт", showButton: true)
    }
}
