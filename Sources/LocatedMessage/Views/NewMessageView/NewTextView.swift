//
//  SwiftUIView.swift
//  
//
//  Created by Done Santana on 6/4/24.
//

import SwiftUI

struct NewTextView: View {
    @State private var messageText = ""
    var body: some View {
        ZStack {
            Text("Type the message...")
                .padding(.top, 10)
                .multilineTextAlignment(.leading)
                .opacity(0.4)
//            TextEditor(text: $messageText)
//                .padding(.all, 10)
//                .opacity(messageText.isEmpty ? 1 : 1)
//                .background(Material.ultraThin, in: RoundedRectangle(cornerRadius: 10))
//                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.all, 25)
    }
}

#Preview {
    NewTextView()
}
