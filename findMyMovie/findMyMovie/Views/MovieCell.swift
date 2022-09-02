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
    
    // 🍎 이미지 URL을 전달받는 속성
    var image: String? {
        didSet {
            loadImage()
        }
    }
    
    // 스토리보드 또는 Nib으로 만들때, 사용하게 되는 생성자 코드
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainImageView.contentMode = .scaleToFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // 🍎 URL ===> 이미지를 셋팅하는 메서드
    // 🍎 이미지 URL이 전달되는 그순간에 이미지를 다운받는 메서드
    private func loadImage() {
        guard let urlString = self.image, let url = URL(string: urlString)  else { return }
        
        DispatchQueue.global().async {
        
            guard let data = try? Data(contentsOf: url) else { return }
            // 오래걸리는 작업이 일어나고 있는 동안에 url이 바뀔 가능성 제거 ⭐️⭐️⭐️
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.mainImageView.image = UIImage(data: data)
            }
            
        }
    }

}


