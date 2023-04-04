import SwiftUI

class StoryViewModel: ObservableObject {
    
    @Published var stories: [Story] = [
        Story(profileImage: "notificationStory", frames: [
            Frame(imageURL: "notification1stCrop"),
            Frame(imageURL: "notification2ndCrop")
        ]),
        Story(profileImage: "chocolateStory", frames: [
            Frame(imageURL: "chocolate1stCrop"),
            Frame(imageURL: "chocolate2ndCrop"),
            Frame(imageURL: "chocolate3rdCrop"),
            Frame(imageURL: "chocolate4thCrop"),
        ]),
        Story(profileImage: "certificateReturnStory", frames: [
            Frame(imageURL: "certificateReturn1stCrop"),
            Frame(imageURL: "certificateReturn2ndCrop"),
            Frame(imageURL: "certificateReturn3rdCrop"),
            Frame(imageURL: "certificateReturn4thCrop"),
            Frame(imageURL: "certificateReturn5thCrop"),
        ]),
        Story(profileImage: "phoneNumberStory", frames: [
            Frame(imageURL: "phoneNumber1stCrop"),
            Frame(imageURL: "phoneNumber2ndCrop"),
            Frame(imageURL: "phoneNumber3rdCrop"),
        ]),
        Story(profileImage: "sbpStory", frames: [
            Frame(imageURL: "sbp1stCrop"),
            Frame(imageURL: "sbp2ndCrop"),
            Frame(imageURL: "sbp3rdCrop"),
        ]),
        Story(profileImage: "sodaStory", frames: [
            Frame(imageURL: "soda1stCrop"),
            Frame(imageURL: "soda2ndCrop")
        ]),
        Story(profileImage: "howToGetRichStory", frames: [
            Frame(imageURL: "howToGetRich1stCrop"),
            Frame(imageURL: "howToGetRich2ndCrop"),
            Frame(imageURL: "howToGetRich3rdCrop"),
            Frame(imageURL: "howToGetRich4thCrop"),
        ]),
    ]
    
    @Published var showStory = false
    @Published var currentStory = ""
}

struct StoryViewModel_Previews: PreviewProvider {
    static var previews: some View {
        StoryView().background(.black)
    }
}

