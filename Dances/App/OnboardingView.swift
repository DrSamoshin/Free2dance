//
//  OnboardingView.swift
//  Dances
//
//  Created by Siarhei Samoshyn on 2023-06-07.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    
    let screens: [OnBoardingScreen] = Bundle.main.decode("onboarding.json")
    
    var body: some View {
        TabView {
            ForEach(screens) { screen in
                OnboardingCardView(screen: screen)
            } //: LOOP
        } //: TABVIEW
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
