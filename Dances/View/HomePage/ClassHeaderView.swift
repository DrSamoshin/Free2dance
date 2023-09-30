//
//  ClassHeaderView.swift
//  Dances
//
//  Created by Siarhei Samoshyn on 2023-06-14.
//

import SwiftUI



struct ClassHeaderView: View {
    
    let class_: Class
    
    var body: some View {
        HStack() {
            Text(class_.title)
                .lineLimit(1)
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
        .background(.white.opacity(0.1))
        .foregroundColor(.white)
        .cornerRadius(15)
    }
}

struct ClassHeaderView_Previews: PreviewProvider {
    static let classes: [Class] = Bundle.main.decode("classes.json")
    static var previews: some View {
        ClassHeaderView(class_: classes[0])
    }
}
