//
//  DetailView.swift
//  tableViewCodeBase
//
//  Created by Hertz on 8/27/22.
//

import UIKit
import SnapKit

final class DetailView: UIView {

    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let personNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 15
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        // 스택뷰 위에 뷰들 올리기
        stackView.addArrangedSubview(mainImageView)
        stackView.addArrangedSubview(personNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        // 뷰컨트롤러의 기본뷰 위에 스택뷰 올리기
        self.addSubview(stackView)
    }
    
    // ⭐️ 오토레이아웃 업데이트 시점 ⭐️
    // UIViewController의 오토레이아웃을 viewDidLoad에서 초기화 하는것과 같은 역할을 수행한다
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    func setConstraints() {
        setMainImageViewConstraints()
        setPersonNameLabelConstraints()
        setDescriptionLabelConstraints()
        setStackViewConstraints()
    }
    
    func setMainImageViewConstraints() {
        
        mainImageView.snp.makeConstraints {
            $0.width.height.equalTo(240)
        }
    }
    
    func setPersonNameLabelConstraints() {

        personNameLabel.snp.makeConstraints {
            $0.height.equalTo(30)
        }
    }
    
    func setDescriptionLabelConstraints() {

        
        descriptionLabel.snp.makeConstraints {
            $0.height.equalTo(100)
        }
    }
    
    func setStackViewConstraints() {
        
        stackView.snp.makeConstraints {
            $0.centerX.equalTo(self.snp.centerX)
            $0.top.equalToSuperview().offset(100)
        }
    }
}
