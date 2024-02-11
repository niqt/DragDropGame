//
//  ImageUIView.swift
//  DragDropGame
//
//  Created by nicola de filippo on 11/02/24.
//

import SwiftUI

struct ImageUIView: View {
    var imageItem: ImageItem
 
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(imageItem.image)
                .resizable()
                .frame(width: 150, height: 150)
        }
        .cornerRadius(8)
    }
}


#Preview {
    ImageUIView(imageItem: ImageItem(name: "glass", image: "glass"))
}
