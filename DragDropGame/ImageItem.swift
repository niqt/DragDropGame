//
//  ImageItem.swift
//  DragDropGame
//
//  Created by nicola de filippo on 11/02/24.
//

import Foundation
import UniformTypeIdentifiers
import SwiftUI

struct ImageItem: Identifiable, Codable, Transferable {
    var id = UUID()
    var name: String
    var image: String
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(for: ImageItem.self, contentType: .image)
        //ProxyRepresentation(exporting: \.name)
    }
    
    static var sampleImages: [ImageItem] {
        [
            ImageItem(name: "newspaper", image: "newspaper"),
            ImageItem(name: "plastic", image: "plastic"),
            ImageItem(name: "glass", image: "glass")
        ]
    }
}


/*extension UTType {
    static var image = UTType(exportedAs: "niqt.drop.image")
}*/

@Observable
class Images  {
    var items = [ImageItem]()
 
    init() {
        items.append(contentsOf: ImageItem.sampleImages)
    }
}

