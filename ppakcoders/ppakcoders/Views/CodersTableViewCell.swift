//
//  CodersTableViewCell.swift
//  ppakcoders
//
//  Created by Hertz on 8/28/22.
//

import UIKit

class CodersTableViewCell: UITableViewCell {
    
    // 27⭐️⭐️⭐️
    // 속성 감시자 member를 선언한후 타입을 Member모델로 설정했다
    // 멤버라는 저장속성을 항상 감시를하는 속성감시자 이기때문에 멤버라는 변수가 만약에 변했다면 didSet안에 블록을 실행한다
    // 예를들어 테이블쎌의 member가 변한다면 쎌의 minImageView의 이미지를 바뀐 Member모델의 mainImage로 할당한다
    var member: Member? {
        didSet {
            guard var member = member else { return }
            mainImageView.image = member.memberImage
            nickNameLabel.text = member.nickName
            membershipLabel.text = member.membership
        }
    }
    
    //MARK: - UI구현
    
    // 17
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 18
    let nickNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // 19
    let membershipLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 20
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    // MARK: - 생성자
    // 21
    // ⭐️UITableViewCell 같은 경우 코드로 UI를 짤때 생성자에서 addSubview 를 해줜다⭐️
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        // super.init을 호출하여 저장속성을 셋팅
        // 첫번째 파라미터는 쎌의 스타일
        // 두번째 파라미터 같은 경우 reuseIdentifier을 할당해주면 된다
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        // 23-1
        setupAddSubView()
    }
    
    // 22
    // 필수 생성자를 구현해주지 않으면 컴파일 에러가 난다
    // ⭐️상위의 지정생성자랑 필수 생성자가 있을때 지정생상자를 재정의 해서 생성자를 구현한다면 반드시 상위에 있는 필수 생성자를 구현해줘야한다⭐️
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 23
    func setupAddSubView() {
        self.addSubview(mainImageView)
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(nickNameLabel)
        stackView.addArrangedSubview(membershipLabel)
    }
    
    //MARK: - 오토레이아웃 셋팅
    // 26
    // updateConstraints메서드를 재정의 해서 오토레이아웃을 업데이트 할수 있다
    // ⭐️⭐️⭐️오토레이아웃 그리는 정확한 시점⭐️⭐️⭐️
    override func updateConstraints() {
        // setConstraints메서드를 호출해서 오토레이아웃을 설정한것을 UITableViewCell에 있는 로직중 updateConstraints메서드를 통해 업데이트 시킨다
        setConstraints()
        super.updateConstraints()
    }
    
    // 25
    // ⭐️⭐️⭐️실제로 이미지의 넓이가 정확하게 결정되는 순간이 layoutSubviews 이후이기때문에
    // 넓이를 반으로 나눠준다음에 코너 레디어스 에 할당하여 메인이미지의 모양을 써클 이미지의 모양으로 만들어준다
    override func layoutSubviews() {
        super.layoutSubviews()
        self.mainImageView.clipsToBounds = true
        self.mainImageView.layer.cornerRadius = self.mainImageView.frame.width / 2
    }
    
    
    // 24
    // 오토레이아웃 잡아주기
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 40),
            mainImageView.widthAnchor.constraint(equalToConstant: 40),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nickNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor)
        ])
    }
    
    // ⭐️스토리보드로 앱을 만들때 생성자와 같은 역할을 하는 코드⭐️
    // ViewController 에서 viewDidLoad같은 역할을 하는 코드
    // viewDidLoad는 화면이 로드 될때 초기화 해주는 역할을 한다
    // viewDidLoad는 반복적으로 호출되는 것인 아니라 1번만 호출된다
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    


    // 스토리 보드 없이 UI를 짰기 때문에 필요없는 메서드이다
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
