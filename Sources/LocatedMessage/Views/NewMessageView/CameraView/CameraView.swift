//
//  File.swift
//  
//
//  Created by Done Santana on 6/8/24.
//

import Foundation
import SwiftUI
import PhotosUI

struct CameraView: View {
    @State private var showPhotoPreview = false
    @State private var showCamera = true
    @State private var selectedImage: UIImage?
    @State private var description: String = ""
    @State var image: UIImage?
    @Environment(\.presentationMode) var isPresented
    @Bindable var locationService = LocationService()
    
    var body: some View {
        
        if let selectedImage {
            VStack {
                HStack{
                    Text("New Photo Message")
                        .font(.headline)
                    Spacer()
                    Button {
                        self.selectedImage = nil
                        self.showCamera = true
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                }
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 4))
                    .shadow(radius: 10)
                TextField("Type the description ...", text: $description) {
                    
                }
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                .padding(.all, 10)
                Button("Send the message") {
                    sendMessage()
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            .padding(.all, 20)
        } else {
            Image(systemName: "camera")
                .resizable()
                .frame(width: 240, height: 200)
                .scaledToFit()
                .fullScreenCover(isPresented: self.$showCamera) {
                    accessCameraView(selectedImage: self.$selectedImage)
                        .edgesIgnoringSafeArea(.all)
                }
                .onTapGesture {
                    showCamera = true
                }
        }
    }
    
    internal func sendMessage() {
        var id = UUID().uuidString
        var currentLocation = $locationService.locationCoordinate
        let params: [String: Any] = [
            "fileId": id,
            "description": description
        ]
        if let dataFile = selectedImage?.pngData() {
            ApiService.shared.uploadFile(parameters: params, file: dataFile) { result in
                switch result {
                case.success(let message):
                    print(message)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
    }
}


struct accessCameraView: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

// Coordinator will help to preview the selected image in the View.
class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: accessCameraView
    
    init(picker: accessCameraView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }
}

#Preview {
    EmptyView()
    //CameraView()
}
