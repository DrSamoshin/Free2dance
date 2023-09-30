//
//  OnboardingCardView.swift
//  Dances
//
//  Created by Siarhei Samoshyn on 2023-06-07.
//

import SwiftUI

struct OnboardingCardView: View {
    // MARK: - PROPERTIES
    
    let screen: OnBoardingScreen
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image(screen.image)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .scaleEffect(isAnimating ? 1.2 : 1.8)
            VStack(alignment: .center, spacing: 9) {
                // TITLE
                Text(screen.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: 3)
                // DESCRIPTION
                Text(screen.description)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 350)
                // BUTTON
                StartButtonView()
                    .padding(.top, 30)
            } //: VSTACK
            .offset(y: 150)
        } //: ZSTACK
        .onAppear {
            withAnimation(.easeOut(duration: 10)) {
                isAnimating = true
            }
        }
    }
}

// MARK: - PREVIEW
struct OnboardingCardView_Previews: PreviewProvider {
    static let screens: [OnBoardingScreen] = Bundle.main.decode("onboarding.json")
    static var previews: some View {
        OnboardingCardView(screen: screens[0])
    }
}

