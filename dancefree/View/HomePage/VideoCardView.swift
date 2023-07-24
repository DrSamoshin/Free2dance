//
//  LessonCardView.swift
//  Dances
//
//  Created by Siarhei Samoshyn on 2023-06-14.
//

import SwiftUI

struct VideoCardView: View {
    
    // MARK: - PROPERTIES
    let video: Video
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image(video.image_large)
                .resizable()
                .scaledToFill()
                .frame(height: 540)
            VStack {
                Spacer()
                HStack() {
                    VStack(alignment: .leading, spacing: 3) {
                        Text(video.title)
                            .lineLimit(2)
                            .font(.title2)
                            .fontWeight(.bold)
                            .shadow(radius: 3)
                            .multilineTextAlignment(.leading)
                        HStack {
                            Image(systemName: "timer")
                            Text("\(video.duration_minutes) minutes")
                        } //: HSTACK
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .shadow(radius: 3)
                    } //: VSTACK
                    Spacer()
                    Image(systemName: "play.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                    
                } //: HSTACK
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(.black.opacity(0.3))
                .foregroundColor(.white)
                .cornerRadius(9)
            }//: VSTACK
            .padding(6)
            .padding(.bottom, 45)
        } //: ZSTACK
        .cornerRadius(15)
        .padding(.horizontal, 21)
        .frame(height: 540)
        
        
        
        
    }
}

// MARK: - PREVIEW
struct VideoCardView_Previews: PreviewProvider {
    static var classes: [Class] = Bundle.main.decode("classes.json")
    static var class_: Class = classes[0]
    static var previews: some View {
        VideoCardView(video: class_.videos[0])
    }
}
