//
//  File.swift
//  
//
//  Created by Done Santana on 7/31/24.
//

import Foundation
import SwiftUI

struct TypeCellView: View {
    var cellImageName: String

    var body: some View {
        VStack {
            Image(systemName: cellImageName)
//            Text("Cell \(index)")
//                .font(.headline)
//                .foregroundColor(.white)
//            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
        .cornerRadius(10)
    }
}
