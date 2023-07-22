//
//  StartButtonView.swift
//  Dances
//
//  Created by Siarhei Samoshyn on 2023-06-07.
//

import SwiftUI

struct StartButtonView: View {
    // MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    // MARK: - BODY
    var body: some View {
        Button {
            isOnboarding = false
        } label: {
            HStack(spacing: 9) {
                Text("Start")
                    .font(.title2)
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            } //: HSTACK
            .padding(.horizontal, 36)
            .padding(.vertical, 12)
            .background(
                Capsule().strokeBorder(.white, lineWidth: 1).opacity(0.4)
            )
            .background(.white.opacity(0.3))
            .cornerRadius(50)
            
        } //: BUTTON
        .tint(.white)

    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
    }
}
