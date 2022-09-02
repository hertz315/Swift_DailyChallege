//
//  HomeInfoTableViewCell.swift
//  LovelyCatPhoto
//
//  Created by Hertz on 9/2/22.
//

import UIKit

class MyCollectionTableViewCell: UITableViewCell {
    
    static let className = "MyCollectionTableViewCell"
    static let cellId = "MyCollectionTableViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(UINib(nibName: MyCollectionTableViewCell.className, bundle: nil), forCellWithReuseIdentifier : MyCollectionTableViewCell.cellId)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

