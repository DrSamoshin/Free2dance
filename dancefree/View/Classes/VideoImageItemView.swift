//
//  ImageItem.swift
//  Dances
//
//  Created by Siarhei Samoshyn on 2023-06-09.
//

import SwiftUI

struct VideoImageItemView: View {
    // MARK: - PROPERTIES
    let imageName: String
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
            Image(systemName: "play.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
        } //: ZSTACK
    }
}

// MARK: - PREVIEW
struct VideoImageItem_Previews: PreviewProvider {
    static var previews: some View {
        VideoImageItemView(imageName: "video_twerk_1")
    }
}
