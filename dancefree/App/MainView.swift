//
//  MainView.swift
//  Dances
//
//  Created by Siarhei Samoshyn on 2023-06-07.
//

import SwiftUI

struct MainView: View {
    //MARK: - PROPERTIES
    
    
    //MARK: - BODY
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            ClassesView()
                .tabItem {
                    Image(systemName: "play.rectangle.on.rectangle.fill")
                    Text("Classes")
                }
                .tag(1)
            SettingsView()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                    Text("Settings")
                }
                .tag(2)
        } //: TABVIEW
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
