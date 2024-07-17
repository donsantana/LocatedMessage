//
//  File.swift
//  
//
//  Created by Done Santana on 6/6/24.
//

import SwiftUI
import AVFoundation

struct CameraPreview: View {
    let selectedImage: UIImage
    
    var body: some View {
        VStack {
            Image(uiImage: selectedImage)
                .resizable()
                .padding(.all, 20)
        }
    }
  
}

#Preview {
    CameraPreview(selectedImage: UIImage(named: "noImage")!)
}
