//
//  PaintingTableViewCell.swift
//  ArtGallery
//
//  Created by Scott Bennett on 9/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol PaintingTableViewCellDelegate: class {
    func likeButtonWasTapped(on cell: PaintingTableViewCell)
}

class PaintingTableViewCell: UITableViewCell {


    @IBOutlet weak var paintingImageCell: UIImageView!
    @IBOutlet weak var isLikdedButton: UIButton!
    
    weak var delegate: PaintingTableViewCellDelegate?
    var painting: Painting? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let painting = painting else { return }
        paintingImageCell.image = painting.image
        
// try ternary operator
        if painting.isLiked {
            isLikdedButton.setTitle("👍", for: .normal)
        } else {
            isLikdedButton.setTitle("👎", for: .normal)
        }
    }
    
    
    @IBAction func isLikedButtonTapped(_ sender: Any) {
        delegate?.likeButtonWasTapped(on: self)
        
    }
    
   
    
}
