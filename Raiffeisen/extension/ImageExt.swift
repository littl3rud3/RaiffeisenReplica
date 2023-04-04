import Foundation
import SwiftUI

extension Image {
    
    func resizeToIcon() -> some View {
        self.resizable()
            .frame(width: 25, height: 25)
    }
}
