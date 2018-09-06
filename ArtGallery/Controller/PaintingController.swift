//
//  PaintingController.swift
//  ArtGallery
//
//  Created by Scott Bennett on 9/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class PaintingController {
    var paintings: [Painting] = []
    
    init() {
        loadPaintingsFromAssests()
    }
    
    
    func loadPaintingsFromAssests() {
        
        for index in 1...12 {
            let paintingName = "Image" + String(index)
            guard let paintingImage = (UIImage(named: paintingName)) else { return }
            let painting = Painting(image: paintingImage, isLiked: true)
            paintings.append(painting)
        }
        
    }
    
    func toggleIsLiked(for painting: Painting) {
        painting.isLiked = !painting.isLiked
    }
}
