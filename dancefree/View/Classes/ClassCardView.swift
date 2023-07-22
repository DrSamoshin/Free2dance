//
//  ClassCardView.swift
//  Dances
//
//  Created by Siarhei Samoshyn on 2023-06-09.
//

import SwiftUI

struct ClassCardView: View {
    // MARK: - PROPERTIES
    let class_: Class
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image(class_.image)
                .resizable()
                .scaledToFill()
                .frame(height: 540)
            VStack {
                Spacer()
                HStack() {
                    Text(class_.title)
                        .lineLimit(2)
                        .font(.title2)
                        .fontWeight(.bold)
                        .shadow(radius: 3)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    VStack(alignment: .leading, spacing: 3) {
                        HStack {
                            Image(systemName: "play.circle")
                            Text("\(class_.videos.count) videos")
                        } //: HSTACK
                        HStack {
                            Image(systemName: "timer")
                            Text("\(class_.duration_minutes) minutes")
                        } //: HSTACK
                    } //: VSTACK
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .shadow(radius: 3)
                } //: HSTACK
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(.black.opacity(0.3))
                .foregroundColor(.white)
                .cornerRadius(9)
            }//: VSTACK
            .padding(6)
        } //: ZSTACK
        .frame(height: 540)
        .cornerRadius(15)
        .overlay(alignment: .topTrailing) {
            Image(systemName: "arrow.right.circle")
                .imageScale(.large)
                .foregroundColor(.secondary)
                .padding()
        } //: OVERLAY
        
    }
}

// MARK: - PREVIEW
struct ClassCardView_Previews: PreviewProvider {
    static let classes: [Class] = Bundle.main.decode("classes.json")
    static var previews: some View {
        ClassCardView(class_: classes[0])
            .padding()
    }
}
