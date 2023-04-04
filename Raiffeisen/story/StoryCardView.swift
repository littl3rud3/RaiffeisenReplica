import SwiftUI

struct StoryCardView: View {

    @Binding var story: Story
    @EnvironmentObject var storyData: StoryViewModel
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    @State var timerProgress: CGFloat = 0
    @State private var isTapped = true

    var body: some View {

        let tap = DragGesture(minimumDistance: 0)
            .onChanged { _ in stopTimer() }
            .onEnded { _ in startTimer() }

        let tap2 = DragGesture(minimumDistance: 1)
            .onEnded { _ in
                withAnimation {
                    storyData.showStory = false
                }
            }

        GeometryReader { proxy in

            ZStack {

                let index = min(Int(timerProgress), story.frames.count - 1)

                if let story = story.frames[index] {
                    Image(story.imageURL)
                        .resizable()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .overlay(

                HStack {

                    Rectangle()
                        .fill(.black.opacity(0.01))
                        .onTapGesture {
                            if (timerProgress - 1) < 0 {
                                updateStory(forward: false)
                            } else {
                                timerProgress = CGFloat(Int(timerProgress - 1))
                            }
                        }.frame(height: 20)

                    Rectangle()
                        .fill(.black.opacity(0.01))
                        .onTapGesture {
                            if (timerProgress + 1) > CGFloat(story.frames.count) {
                                updateStory()
                            } else {
                                timerProgress = CGFloat(Int(timerProgress + 1))
                            }
                        }.frame(height: 20)
                }
            )
            .gesture(tap2)
            .overlay(
                Button(
                    action: {
                        withAnimation {
                            storyData.showStory = false
                        }
                    },
                    label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                )
                .padding()
                .padding(.top, 70), alignment: .topTrailing
            )
            .overlay(alignment: .bottomLeading, content: {
                Button(
                    action: {
                        withAnimation {
                            storyData.showStory = false
                        }
                    },
                    label: {
                        Image(systemName: "hand.thumbsup")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                            .background(Circle().fill(.white).frame(width: 50, height: 50))
                            .padding(.leading, 40)
                            .padding(.bottom, 35)
                    }
                )
            })
            .overlay(alignment: .bottomLeading, content: {
                Button(
                    action: {
                        withAnimation {
                            storyData.showStory = false
                        }
                    },
                    label: {
                        let uiImage = UIImage(systemName: "hand.thumbsdown")?.withHorizontallyFlippedOrientation()
                        Image(uiImage: uiImage!)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                            .background(Circle().fill(.white).frame(width: 50, height: 50))
                            .padding(.leading, 105)
                            .padding(.bottom, 35)
                    }
                )
            })
            .overlay(
                HStack(alignment: .top, spacing: 5) {
                    ForEach(story.frames.indices) { index in

                        GeometryReader { proxy in
                            let width = proxy.size.width
                            let progress = timerProgress - CGFloat(index)
                            let perfectProgress = min(max(progress, 0), 1)

                            Capsule()
                                .fill(.gray.opacity(0.5))
                                .overlay(
                                    Capsule().fill(.black).frame(width: width * perfectProgress),
                                    alignment: .leading)
                                .frame(height: 4)
                        }
                    }
                }
                .frame(height: 1.4)
                .padding(.horizontal)
                .padding(.top, 60), alignment: .top
            )
            .rotation3DEffect(
                getAngle(proxy: proxy), axis: (x: 0, y: 1, z: 0),
                anchor: proxy.frame(in: .global).minX > 0 ? .leading : .trailing, perspective: 2.5)
        }
        .onAppear(perform: {
            timerProgress = 0
        })
        .ignoresSafeArea(.all)
        .onReceive(timer) { _ in
            if isTapped {
                if storyData.currentStory == story.id {
                    if !story.isSeen {
                        story.isSeen = true
                    }

                    if timerProgress < CGFloat(story.frames.count) {
                        timerProgress += 0.03
                    } else {
                        updateStory()
                    }
                }
            }
        }
    }

    func stopTimer() {
        self.timer.upstream.connect().cancel()
        isTapped.toggle()
    }

    func startTimer() {
        self.timer = timer.upstream.autoconnect()
        isTapped.toggle()
    }

    private func updateStory(forward: Bool = true) {
        let index = min(Int(timerProgress), story.frames.count - 1)
        let frame = story.frames[index]

        if !forward {

            if let first = storyData.stories.first, first.id != story.id {

                let storyIndex =
                    storyData.stories.firstIndex { currentstory in
                        return story.id == currentstory.id
                    } ?? 0

                withAnimation {
                    storyData.currentStory = storyData.stories[storyIndex - 1].id
                }
            } else {
                timerProgress = 0
            }

            return
        }

        if let last = story.frames.last, last.id == story.id {
            if let laststory = storyData.stories.last, laststory.id == story.id {
                withAnimation {
                    storyData.showStory = false
                }
            } else {
                let storyIndex =
                    storyData.stories.firstIndex { currentstory in
                        return story.id == currentstory.id
                    } ?? 0

                withAnimation {
                    storyData.currentStory = storyData.stories[storyIndex + 1].id
                }
            }
        }
    }

    func getAngle(proxy: GeometryProxy) -> Angle {

        let progress = proxy.frame(in: .global).minX / proxy.size.width

        let rotationAngle: CGFloat = 45
        let degrees = rotationAngle * progress

        return Angle(degrees: Double(degrees))
    }
}

struct StoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView().background(.gray)
    }
}

