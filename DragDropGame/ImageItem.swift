//
//  ImageItem.swift
//  DragDropGame
//
//  Created by nicola de filippo on 11/02/24.
//

import Foundation
import SwiftUI

struct ImageItem: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

@Observable
class Images  {
    var items: Array<ImageItem> = Array<ImageItem>()
 
    init() {
        items = [
            ImageItem(name: "newspaper", image: "newspaper"),
            ImageItem(name: "plastic", image: "plastic"),
            ImageItem(name: "glass", image: "glass")
        ]
    }
}

