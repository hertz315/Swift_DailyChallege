//
//  DetailViewController.swift
//  tableViewCodeBase
//
//  Created by Hertz on 8/27/22.
//

import UIKit

class DetailViewController: UIViewController {

    // MVC패턴을 위한 따로만든 뷰
    let detailView = DetailView()
    
    // 전화면에서 Movie데이터를 전달 받기 위한 변수
    var profileData: Profile?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        detailView.mainImageView.image = profileData?.profileImage
        detailView.personNameLabel.text = profileData?.personName
        detailView.descriptionLabel.text = profileData?.personDescription
    }
    
}
