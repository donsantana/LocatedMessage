//
//  SwiftUIView.swift
//  
//
//  Created by Done Santana on 6/4/24.
//

import SwiftUI

public struct CreateMessageView: View {
    
    public var body: some View {
        TabView {
            NewPhotoView()
                .tabItem {
                    Label("Photo", systemImage: "camera")
                }
            NewAudioView()
                .tabItem {
                    Label("Audio", systemImage: "mic")
                }
        }
        .onAppear(perform: {
            //LocationService.shared.checkLocationStatus()
        })
        
    }
    public init() {}
}

#Preview {
    CreateMessageView()
}
