//
//  VideoPlayerView.swift
//  Dances
//
//  Created by Siarhei Samoshyn on 2023-06-09.
//
// "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    // MARK: - PROPERTIES
    @Environment (\.dismiss) var dismiss
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    @AppStorage("videoLink") var videoLink: String = ""
    
    @State private var player = AVPlayer()
    var notification = NotificationCenter.default.publisher(for: .AVPlayerItemDidPlayToEndTime)
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            VideoPlayer(player: player)
                .ignoresSafeArea()
                .onAppear {
                    do {
                        try AVAudioSession.sharedInstance().setCategory(.playback)
                    } catch {
                        print("error")
                    }
                    if let link = URL(string: videoLink) {
                        player = AVPlayer(url: link)
                        player.play()
                    } else {
                        //
                    }
//                    if let link = Bundle.main.url(forResource: "lesson_twerk_1", withExtension: "mp4") {
//                        player = AVPlayer(url: link)
//                        player.play()
//                    }
                } //: ONAPPEAR
                .onReceive(notification) { _ in
                    print("end")
                } //: ONRECEIVE
                .toolbar {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    } //: BUTTON
                } //: TOOLBAR
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VideoPlayerView()
        }
    }
}
