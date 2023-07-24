//
//  LessonsTabView.swift
//  Dances
//
//  Created by Siarhei Samoshyn on 2023-06-14.
//

import SwiftUI

struct LessonsTabView: View {
    
    // MARK: - PROPERTIES
    let class_: Class
    @Binding var isShowPlayer: Bool
    @Binding var videoLink: String
    @Binding var tag: Int
    
    // MARK: - BODY
    var body: some View {
        VStack {
            TabView(selection: $tag) {
                ForEach(class_.videos) { video in
                    VideoCardView(video: video)
                        
                    .onTapGesture {
                        isShowPlayer = true
                        videoLink = video.video_link
                    } //: TAB
                    
                } //: LOOP
            } //: TABVIEW
            .tabViewStyle(PageTabViewStyle())
        } //: VSTACK
//        .padding(.horizontal, 18)
    }
}

// MARK: - PREVIEW
struct LessonsTabView_Previews: PreviewProvider {
    static var classes: [Class] = Bundle.main.decode("classes.json")
    static var previews: some View {
        LessonsTabView(class_: classes[0], isShowPlayer: .constant(false), videoLink: .constant(""), tag: .constant(1))
    }
}
