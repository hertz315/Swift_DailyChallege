//
//  MovieCell.swift
//  findMyMovie
//
//  Created by Hertz on 8/29/22.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var actorNameLabel: UILabel!
    
    @IBOutlet weak var directorNameLabel: UILabel!
    
    @IBOutlet weak var userRatingLabel: UILabel!
    
    // π μ΄λ―Έμ§ URLμ μ λ¬λ°λ μμ±
    var image: String? {
        didSet {
            loadImage()
        }
    }
    
    // μ€ν λ¦¬λ³΄λ λλ NibμΌλ‘ λ§λ€λ, μ¬μ©νκ² λλ μμ±μ μ½λ
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainImageView.contentMode = .scaleToFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // π URL ===> μ΄λ―Έμ§λ₯Ό μννλ λ©μλ
    // π μ΄λ―Έμ§ URLμ΄ μ λ¬λλ κ·Έμκ°μ μ΄λ―Έμ§λ₯Ό λ€μ΄λ°λ λ©μλ
    private func loadImage() {
        guard let urlString = self.image, let url = URL(string: urlString)  else { return }
        
        DispatchQueue.global().async {
        
            guard let data = try? Data(contentsOf: url) else { return }
            // μ€λκ±Έλ¦¬λ μμμ΄ μΌμ΄λκ³  μλ λμμ urlμ΄ λ°λ κ°λ₯μ± μ κ±° β­οΈβ­οΈβ­οΈ
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.mainImageView.image = UIImage(data: data)
            }
            
        }
    }

}


