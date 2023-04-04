import SwiftUI

struct StoryView: View {

    @StateObject var storyData = StoryViewModel()

    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {

                ForEach($storyData.stories) { $story in

                    ProfileView(story: $story).environmentObject(storyData)
                }
            }
        }
        .fullScreenCover(isPresented: $storyData.showStory) {
            StoryDetailView().environmentObject(storyData).ignoresSafeArea(.all)
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView().background(.gray)
    }
}
