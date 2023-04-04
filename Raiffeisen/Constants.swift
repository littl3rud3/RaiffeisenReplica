import SwiftUI

struct Constants {
    
    static let BACKGROUND = Color(#colorLiteral(red: 0.1510495543, green: 0.1593116224, blue: 0.1782040298, alpha: 1))

    static func BACK_BUTTON() -> some View {
        Image(systemName: "arrow.left").foregroundColor(.white)
    }
    
    static func EXPENSES_BUTTON() -> some View {
        Image("expensesIcon").resizeToIcon()
    }
}
