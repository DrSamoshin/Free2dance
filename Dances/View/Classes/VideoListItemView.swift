//
//  VideoListItemView.swift
//  Dances
//
//  Created by Siarhei Samoshyn on 2023-06-09.
//

import SwiftUI

struct VideoListItemView: View {
    // MARK: - PROPERTIES
    let video: Video
    
    // MARK: - BODY
    var body: some View {
            HStack(spacing: 12) {
                VideoImageItemView(imageName: video.image_small)
                    .frame(width: 100, height: 100)
                    .cornerRadius(9)
                    .padding(6)
                VStack(alignment: .leading, spacing: 3) {
                    Text("\(video.id). \(video.title)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .lineLimit(1)
                    HStack {
                        Image(systemName: "timer")
                        Text("\(video.duration_minutes) minutes")
                    } //: HSTACK
                    .font(.callout)
                    .foregroundColor(.secondary)
                } //: VSTACK
                .foregroundColor(.primary)
                Spacer()
            } //: HSTACK
            .background(Color("ColorBack").opacity(0.1))
            .cornerRadius(15)
        }
    }

// MARK: - PREVIEW
struct VideoListItemView_Previews: PreviewProvider {
    static var classes: [Class] = Bundle.main.decode("classes.json")
    static var class_: Class = classes[0]
    static var previews: some View {
        VideoListItemView(video: class_.videos[0])
            .padding()
    }
}
