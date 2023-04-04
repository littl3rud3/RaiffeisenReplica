import Foundation
import SwiftUI

extension Double {
    
    func smallDecimal(font decimalPartSize: CGFloat) -> Text {
        
        let wholePart = String("\(self)".split(separator: ".")[0])
        let decimal = String("\(self)".split(separator: ".")[1])
        
        return Text(wholePart + ",")
        + Text(decimal.count < 2 ? "\(decimal)0" : "\(decimal)")
            .font(.system(size: decimalPartSize))
        + Text(" ₽")
    }
}
