//
//  VideoListView.swift
//  Dances
//
//  Created by Siarhei Samoshyn on 2023-06-09.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - PROPERTIES
    
    let class_: Class
    @State private var isShowPlayer: Bool = false
    @AppStorage("videoLink") var videoLink: String = ""
    
    @AppStorage("lastDisplayedVideoLatin") var lastDisplayedVideoLatin: Int = 1
    @AppStorage("lastDisplayedVideoHipHop") var lastDisplayedVideoHipHop: Int = 1
    @AppStorage("lastDisplayedVideoStrip") var lastDisplayedVideoStrip: Int = 1
    @AppStorage("lastDisplayedVideoConte") var lastDisplayedVideoConte: Int = 1
    @AppStorage("lastDisplayedVideoTwerk") var lastDisplayedVideoTwerk: Int = 1
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Image(class_.image)
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipShape(Rectangle())
                .navigationTitle("Lessons")
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(class_.videos) { video in
                    VideoListItemView(video: video)
                        .padding(.horizontal, 12)
                        .onTapGesture {
                            videoLink = video.video_link
                            isShowPlayer = true
                            
                            print(videoLink)
                            switch class_.id {
                            case "latin":
                                lastDisplayedVideoLatin = video.id
                            case "twerk":
                                lastDisplayedVideoTwerk = video.id
                            case "strip":
                                lastDisplayedVideoStrip = video.id
                            case "conte":
                                lastDisplayedVideoConte = video.id
                            default:
                                lastDisplayedVideoHipHop = video.id
                            }
                        } //: TAB
                } //: FOREACH
                Spacer()
            } //: SCROLL
        } //: VSTACK
        .ignoresSafeArea(edges: .top)
        .sheet(isPresented: $isShowPlayer) {
            VideoPlayerView()
        } //: SHEET
    }
}

// MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VideoListView(class_: classes[0])
        }
    }
}
