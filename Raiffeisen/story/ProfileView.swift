import SwiftUI

struct ProfileView: View {
    
    @Binding var story: Story
    @EnvironmentObject var storyData: StoryViewModel
    let grayStroke = Color(#colorLiteral(red: 0.278398782, green: 0.2916629612, blue: 0.3085260987, alpha: 1))
    
    var body: some View {
        
        Image(story.profileImage)
            .resizable()
            .frame(width: 110, height: 110)
            .background(RoundedRectangle(cornerRadius: 20).stroke(story.isSeen ? grayStroke : .white, lineWidth: 2)
                    .background(RoundedRectangle(cornerRadius: 20))
            )
            .onTapGesture {
                story.isSeen = true
                storyData.showStory = true
                storyData.currentStory = story.id
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView().background(.gray)
    }
}
