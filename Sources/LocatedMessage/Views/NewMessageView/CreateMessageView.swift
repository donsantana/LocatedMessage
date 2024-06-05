//
//  SwiftUIView.swift
//  
//
//  Created by Done Santana on 6/4/24.
//

import SwiftUI

struct CreateMessageView: View {
    var body: some View {
        TabView {
            NewTextView()
                .tabItem {
                    Label("Text", systemImage: "textformat")
                }
            NewPhotoView()
                .tabItem {
                    Label("Photo", systemImage: "camera")
                }
            NewAudioView()
                .tabItem {
                    Label("Photo", systemImage: "mic")
                }
        }
        
    }
}

#Preview {
    CreateMessageView()
}
