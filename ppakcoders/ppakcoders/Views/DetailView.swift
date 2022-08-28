//
//  DetailView.swift
//  ppakcoders
//
//  Created by Hertz on 8/28/22.
//

import UIKit

// DetailView를 만드는 이유는 MVC패턴으로 만들기때문이다
class DetailView: UIView {

    //MARK: - 멤버 저장속성 구현
    // 68
    // 멤버 데이터가 바뀌면 ===> didSet(속성감시자) 실행
    // 속성감시자도 (저장 속성을 관찰하는) 어쨌든 자체는 메서드임
    var member: Member? {
        didSet {
            guard var member = member else {
                // 멤버가 없으면 (즉, 새로운 멤버를 추가할때의 상황)
                // 멤버가 없으면 버튼을 "SAVE"라고 셋팅
                saveButton.setTitle("SAVE", for: .normal)
                // 멤버가 없으면, 타입 저장 속성의 현재 숫자 가져오기
                memberIdTextField.text = "\(Member.memberNumbers)"
                return
            }
            // 멤버가 있으면
            // 멤버 저장속성이 변하면 멤버의 프로필,이름,폰넘버,주소 를 뽑아서 뷰의 화면에 표시
            mainImageView.image = member.memberImage
            memberIdTextField.text = "\(member.memberId)"
            nickNameTextField.text = member.nickName
            membershipTextField.text = member.membership
            figmaTextField.text = member.figmaAdress
            
            
            // 나이항목의 구현
            // 나이항목이 있다면 나이를 문자열로 변환해가지고 ageTextField 에 표시 없으면 빈문자열 표시
            consultCountTextField.text = member.consultCount != nil ? "\(member.consultCount!)" : ""
        }
    }
    //MARK: - UI구현
    // 29
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 75
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    // 30
    // 정렬을 깔끔하게 하기 위한 컨테이너뷰
    lazy var imageContainView: UIView = {
        let view = UIView()
        view.addSubview(mainImageView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // 31
    let memberIdLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "멤버번호:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 32
    let memberIdTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    // 33
    lazy var memberIdStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [memberIdLabel, memberIdTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    // 34
    let nickNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "닉 네 임:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 35
    let nickNameTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    // 36
    lazy var nickNameStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [nickNameLabel, nickNameTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    // 37
    let membershipLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "멤버쉽 등급:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 38
    let membershipTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    // 39
    lazy var membershipStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [membershipLabel, membershipTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    // 40
    let consultCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "컨설팅 횟수:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 41
    let consultCountTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    // 42
    lazy var consultStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [consultCountLabel, consultCountTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    // 43
    let figmaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "피그마 이메일:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 44
    let figmaTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    // 45
    lazy var figmaAddressStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [figmaLabel, figmaTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    // 46
    let saveButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .gray
        button.setTitle("UPDATE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.frame.size.height = 50
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //47
    lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [imageContainView, memberIdStackView, nickNameStackView, membershipStackView, consultStackView, figmaAddressStackView, saveButton])
        stview.spacing = 10
        stview.axis = .vertical
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    // 50⭐️
    // 레이블 넓이 저장을 위한 속성
    // 레이블의 넓이를 가지고 오토레이아웃을 설정
    // 나중에 UI를 변경할일이 있을때 쉽게 바꿀수 있다
    let labelWidth: CGFloat = 70
    
    // 51⭐️
    // 키보드가 올라왔을때 오토레이아웃의 애니메이션을 넣어서 변경해야하므로
    // NSLayoutConstraint변수를 설정
    var stackViewTopConstraint: NSLayoutConstraint!
    
    // MARK: - 생성자
    // 48
    // 뷰를 만드는 생성자는 프레임을 가지고 만들수 있다
    // DetailView 객체가 생성이 될때
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 55
        // 스택뷰를 셋업 해주는 코드
        setupStackView()
        
        // 66
        // 뷰의 백그라운드를 흰색으로 설정
        self.backgroundColor = .white
        
        // 85
        // 생성자에서 호출을 통해 메모리에 올리면서 초기화
        setupMemberIdTextField()
        
        // 88
        // DetailView객체가 생성이 될때 운영체제에서 Notification을 받을수 있는 그런것을 셋팅을 해주는 코드
        setupNotification()
        
    }
    
    // 49
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMemberIdTextField() {
        memberIdTextField.delegate = self
    }
    
    // 54
    // 전체를 감싸는 스택뷰를 addSubview하는 코드
    func setupStackView() {
        self.addSubview(stackView)
    }
    
    // 87⭐️⭐️⭐️⭐️⭐️
    // 노트피케이션함수를 셋팅하는 메서드를 생성
    func setupNotification() {
        // 89
        // 노티피케이션을 통해 키보드가 올라오는것을 전달받으면 메서드의 파라미터 들을 실행
        // 싱클톤 패턴이다 == 앱을 실행하면 하나만 존재하는 객체
        // 첫번째 파라미터는 관찰을 할 객체를 설정해준다
        // 두번째 파라미터에서는 이벤트를 처리할수 있는 셀렉터를 넣어준다
        // 세번재 파라미터에서는 키보드가 올라올때 뭔가 알림을 주겠다는 의미
        // 네번째 파라미터는 키보드가 올라올때 키보드가 올라올때 추가적인 정보를 전달한다
        // ⭐️⭐️⭐️⭐️⭐️
        // 애플이 미리 만들어 놓은 키보드가 올라온다는 알림을 발송하는 객체가 있는대(UIResponder.keyboardWillShowNotification) 이런 알림을 받을려면 NotificationCenter.addObserver 라는 addObserver(관찰자를 추가)하면 알림을 발송할때 알림을 받을수 있다
        // 알림을 받으면 셀렉터에 있는 함수를 실행한다
        // ⭐️⭐️⭐️⭐️⭐️
        NotificationCenter.default.addObserver(self, selector: #selector(moveUpAction), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(moveDownAction), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    //MARK: - 오토레이아웃 셋팅
    // 53
    // 오토레이아웃 업데이트
    // ⭐️오토레이아웃을 그려주는 정확한 시점이다⭐️
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    // 52
    // 오토레이아웃을 셋팅해 주는 코드
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 150),
            mainImageView.widthAnchor.constraint(equalToConstant: 150),
            mainImageView.centerXAnchor.constraint(equalTo: imageContainView.centerXAnchor),
            mainImageView.centerYAnchor.constraint(equalTo: imageContainView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageContainView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            memberIdLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            nickNameLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            membershipLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            consultCountLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            figmaLabel.widthAnchor.constraint(equalToConstant: labelWidth)
        ])
        
        // 키보드가 올라올때 스택뷰의 위치를 위로 올리기 위해서
        // stackView의 오토레이아웃 코드를 stackViewTopConstraint에 할당했다
        stackViewTopConstraint = stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10)
        
        NSLayoutConstraint.activate([
            stackViewTopConstraint,
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    // 86
    // 키보드가 올라오는 순간에 실행을 시켜야 한다
    //MARK: - 키보드가 나타날때와 내려갈때의 애니메이션 셋팅
    // 뷰가 전체적으로 올라가는 함수
    @objc func moveUpAction() {
        // 모든 요소를 담은 스택뷰를 올라가도록 만듬
        stackViewTopConstraint.constant = -20
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    // 뷰가 전체적으로 내려가는 함수
    @objc func moveDownAction() {
        // 모든 요소를 담은 스택뷰를 내려가도록 만듬
        stackViewTopConstraint.constant = 10
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    // 91
    // 화면을 터치하면 키보드가 내려가는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    // 90
    //MARK: - 소멸자 구현
    // 해제 안하면 힙 메모리 영역에서 사라지지 않을수 있다
    deinit {
        // ⭐️⭐️노티피케이션의 등록 해제 (해제안하면 계속 등록될 수 있음)⭐️⭐️
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
}

// 83
//MARK: - 텍스트필드 델리게이트 구현
// 텍스트 필드 델리게이트를 채택
extension DetailView: UITextFieldDelegate {
    // 텍스트 필드의 내용이 눌릴때마다 호출 하는 메서드 == shouldChangeCharacterIn
    // 텍스트 필드가 입력이 될때마다 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // ⭐️⭐️⭐️멤버 아이디는 수정 못하도록 설정 (멤버아이디의 텍스트필드는 입력 안되도록 설정)
        // 지금 현재 입력되고 있는 텍스트필드가 멤버 아이디와 관련된 텍스트 필드라면 리턴을 통해 메서드를 빠져나감
        // false라고 리턴을 해주면 수정이 안됨
        if textField == memberIdTextField {
            return false
        }
        
        // 나머지 텍스트필드는 관계없이 설정 가능
        return true
    }
}
