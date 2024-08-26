//
//  SwiftUIView.swift
//  
//
//  Created by Done Santana on 6/4/24.
//

import SwiftUI

public struct CreateMessageView: View {
    
    public var body: some View {
        NewPhotoView()
            .navigationBarBackButtonHidden(true)
//        NavigationStack {
//            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], content: {
//                NavigationLink("Photo Message", value: "1")
//                NavigationLink("Audio Message", value: "2")
//            })
//            .navigationDestination(for: String.self) { messageType in
//                if messageType == "1" {
//                    NewPhotoView()
//                        .navigationBarBackButtonHidden(true)
//                } else {
//                    Text("Audio Message")
//                }
//               
//            }
//        }
        
//        TabView {
//            NewPhotoView()
//                .tabItem {
//                    Label("Photo", systemImage: "camera")
//                }
//            NewAudioView()
//                .tabItem {
//                    Label("Audio", systemImage: "mic")
//                }
//        }
//        .onAppear(perform: {
//            //LocationService.shared.checkLocationStatus()
//        })
        
    }
    public init() {}
}

#Preview {
    CreateMessageView()
}

struct MessageType: Hashable {
    var typename: String = ""
}
