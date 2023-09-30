//
//  ClassesView.swift
//  Dances
//
//  Created by Siarhei Samoshyn on 2023-06-08.
//

import SwiftUI

struct ClassesView: View {
    // MARK: - PROPERTIES
    @AppStorage("lastDisplayedClass") var lastDisplayedClass: Int = 0
    @State var classes: [Class] = Bundle.main.decode("classes.json")
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(classes) { item in
                    NavigationLink(destination: VideoListView(class_: item).onAppear() {
                            switch item.id {
                            case "latin":
                                lastDisplayedClass = 0
                            case "strip":
                                lastDisplayedClass = 1
                            case "conte":
                                lastDisplayedClass = 2
                            case "twerk":
                                lastDisplayedClass = 3
                            default:
                                lastDisplayedClass = 4
                                
                            }
                        }) {
                        ClassCardView(class_: item)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 3)
                    } //: LINK
                } //: FOREACH
            } //: SCROLL
            .navigationTitle("Classes")
            
            
        } //: NAVIGATION
        
        
    }
}

// MARK: - PREVIEW
struct ClassesView_Previews: PreviewProvider {
    static var previews: some View {
        ClassesView()
    }
}
