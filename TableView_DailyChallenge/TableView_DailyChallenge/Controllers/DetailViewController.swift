//
//  DetailViewController.swift
//  TableView_DailyChallenge
//
//  Created by Hertz on 8/26/22.
//

import UIKit

class DetailViewController: UIViewController {

    // ⭐️ 전화면으로 부터 데이터를 전달받아서 표시를 해주기 위한 저장속성 생성 ⭐️
    var profileData: Profile?
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var personNameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
        
    }
    
    func makeUI() {
        // ⭐️ 같은 옵셔널 타입이기때문에 옵셔널 바인딩을 하지 않고 할당 해도 된다 ⭐️
        mainImageView.image = profileData?.profileImage
        personNameLabel.text = profileData?.personName
        descriptionLabel.text = profileData?.personDescription
    }



}
