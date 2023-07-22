//
//  HomeView.swift
//  Dances
//
//  Created by Siarhei Samoshyn on 2023-06-08.
//

import SwiftUI


struct HomeView: View {
    
    // MARK: - PROPERTIES
    @AppStorage("lastDisplayedClass") var lastDisplayedClass: Int = 0
    @State private var isShowPlayer: Bool = false

    @State private var tag: Int = 4
    
    @AppStorage("videoLink") var videoLink: String = ""
    @AppStorage("lastDisplayedVideoLatin") var lastDisplayedVideoLatin: Int = 1
    @AppStorage("lastDisplayedVideoHipHop") var lastDisplayedVideoHipHop: Int = 1
    @AppStorage("lastDisplayedVideoStrip") var lastDisplayedVideoStrip: Int = 1
    @AppStorage("lastDisplayedVideoConte") var lastDisplayedVideoConte: Int = 1
    @AppStorage("lastDisplayedVideoTwerk") var lastDisplayedVideoTwerk: Int = 1
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            VStack {
                Divider().opacity(0)
                ScrollView(.vertical, showsIndicators: false) {
                    ClassHeaderView(class_: classes[lastDisplayedClass])
                        .padding([.top, .horizontal], 21)
                    LessonsTabView(class_: classes[lastDisplayedClass], isShowPlayer: $isShowPlayer, videoLink: $videoLink, tag: $tag)
                        .frame(height: 510)
                    Text("Continue to explore your movement potential")
                        .font(.title)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 30)
                } //: SCROLL
                .sheet(isPresented: $isShowPlayer) {
                    VideoPlayerView()
                }
            }
        }
        .onAppear() {
            switch classes[lastDisplayedClass].id {
            case "latin":
                tag = lastDisplayedVideoLatin
            case "twerk":
                tag = lastDisplayedVideoTwerk
            case "strip":
                tag = lastDisplayedVideoStrip
            case "conte":
                tag = lastDisplayedVideoConte
            default:
                tag = lastDisplayedVideoHipHop
            }
        }
    }
}

// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
