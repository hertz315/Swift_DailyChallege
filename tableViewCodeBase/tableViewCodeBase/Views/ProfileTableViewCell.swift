//
//  ProfileTableViewCell.swift
//  tableViewCodeBase
//
//  Created by Hertz on 8/27/22.
//

import UIKit
import SnapKit

//
// ProfileTableViewCell에서 쎌의 화면 구성 설정
final class ProfileTableViewCell: UITableViewCell {
    
    //
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let personNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        // 줄이 길어지면 다음줄로 내려가게 설정
        label.numberOfLines = 0
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        // 스택뷰의 축 설정
        sv.axis = .vertical
        // 스택뷰의 배분 설정
        sv.distribution  = .fill
        // 스택뷰의 정렬 방식 설정
        sv.alignment = .fill
        // 스택뷰에서 요소 사이의 간격 설정
        sv.spacing = 8
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupAddSubView()
    }
    
    // 스택뷰
    func setupAddSubView() {
        // 쎌에다가 스택뷰 올리기
        self.addSubview(mainImageView)
        
        // 쎌의 기본뷰 위에 스택뷰 올리기
        self.addSubview(stackView)
        
        // 스택뷰 위에 레이블 올리기
        stackView.addArrangedSubview(personNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ⭐️ 오토레이아웃 정하는 정확한 시점 ⭐️
    // UITableViewCell 에서는 updateConstraints() 에서 오토레이아웃을 잡을수 있다
    // ⭐️⭐️ updateConstraints() 메서드에서는 super를 맨마지막에 선언해줘야한다 ⭐️⭐️
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    func setConstraints() {
        setMainImageViewConstraints()
        setPersonNameLabelConstraints()
        setStackViewConstraints()
    }
    
    
    // 메인이미지 오토레이아웃 잡기
    func setMainImageViewConstraints() {
        // 메인 이미지 오토레이아웃
        mainImageView.snp.makeConstraints {
            $0.height.width.equalTo(100)
            $0.leading.equalTo(self.snp.leading).offset(10)
            $0.centerY.equalTo(self.snp.centerY)
        }
    }
    
    // personNameLabel 오토레이아웃 잡기
    func setPersonNameLabelConstraints() {
        personNameLabel.snp.makeConstraints {
            $0.height.equalTo(22)
        }
    }
    
    // 스택뷰의 오토레이아웃 잡기
    func setStackViewConstraints() {
        stackView.snp.makeConstraints {
            $0.leading.equalTo(mainImageView.snp.trailing).offset(15)
            $0.trailing.equalTo(self.snp.trailing)
            $0.top.equalTo(self.mainImageView.snp.top)
            $0.bottom.equalTo(self.mainImageView.snp.bottom)
        }
    }
}

