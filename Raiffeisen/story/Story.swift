import SwiftUI

struct Story : Identifiable, Hashable {
    var id = UUID().uuidString
    var profileImage: String
    var isSeen = false
    var frames: [Frame]
}

struct Frame: Identifiable, Hashable {
    var id = UUID().uuidString
    var imageURL: String
}

