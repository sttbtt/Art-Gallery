//
//  PaintingListViewController.swift
//  ArtGallery
//
//  Created by Scott Bennett on 9/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PaintingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PaintingTableViewCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let paintingController = PaintingController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        self.tableView.rowHeight = 350
 //       tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paintingController.paintings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "artCell", for: indexPath)
        guard let paintingCell = cell as? PaintingTableViewCell else { return cell }
        
        let painting = paintingController.paintings[indexPath.row]
        
        paintingCell.painting = painting
        paintingCell.delegate = self
        
        return paintingCell
        
    }
    
    func likeButtonWasTapped(on cell: PaintingTableViewCell) {
        guard let index = tableView.indexPath(for: cell) else { return }
        let paintingSelected = paintingController.paintings[(index.row)]
        paintingController.toggleIsLiked(for: paintingSelected)
        tableView.reloadRows(at: [index], with: .none)
    }
}
