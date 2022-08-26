//
//  ProfileTableViewCell.swift
//  TableView_DailyChallenge
//
//  Created by Hertz on 8/26/22.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var personName: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
