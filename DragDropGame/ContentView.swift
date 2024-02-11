//
//  ContentView.swift
//  DragDropGame
//
//  Created by nicola de filippo on 11/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var images = Images()
    @State private var borderColor: Color = .yellow
    @State private var borderWidth: CGFloat = 1.0
    @State private var imageName: String = ""
    @State private var draggingItem: ImageItem?
    
    var body: some View {
        HStack {
            VStack {
                ForEach(images.items, id: \.id) { imageItem in
                    ImageUIView(imageItem: imageItem)
                        .onDrag({
                            draggingItem = imageItem
                            return NSItemProvider() })
                }
            }
            .frame(width: 150)
            .frame(maxHeight: 150)
            .padding(.leading)

            Spacer()
            
            VStack {
                VStack {
                    Image(systemName: "trash")
                        .resizable()
                }
                .frame(width: 280, height: 220)
                .background(Color.gray.opacity(0.25))
                .border(borderColor, width: borderWidth)
                .padding(.trailing)
                .onDrop(of: [.text], delegate: DropViewDelegate(items:$images.items, draggedItem: $draggingItem))
            }
        }
    }
}

struct DropViewDelegate: DropDelegate {
    @Binding var items: [ImageItem]
    @Binding var draggedItem: ImageItem?
    
    func performDrop(info: DropInfo) -> Bool {
        items.remove(at: 0)
        return true
    }
    
    func validateDrop(info: DropInfo) -> Bool {
        if let draggedItem = draggedItem, draggedItem.name == "newspaper" {
            return true
        }
        return false
    }
}

#Preview {
    ContentView()
}
