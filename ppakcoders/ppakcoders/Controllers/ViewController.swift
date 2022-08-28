//
//  ViewController.swift
//  ppakcoders
//
//  Created by Hertz on 8/28/22.
//

import UIKit

final class ViewController: UIViewController {

    // 10
    // ⭐️멤버 데이터 비즈니스로직을 담당하고 있는 MemberListManager한테 ViewController 에게 접근할수 있게끔 저장속성을 선언한후 저장속성을 MemberListManager 객체로 만들기
    var memberListManager = MemberListManager()
    
    // 1
    // 테이블 뷰 생성하기
    private let tableView = UITableView()
    
    // 74
    // 네비게이션 바에 넣기 위한 버튼
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return button
    }()
    
    // ⭐️⭐️⭐️73⭐️⭐️⭐️
    // viewWillAppear는 어떤 화면으로 갔다가 다시 돌아올때 화면이 나타날때 마다 언제든지 재호출이 되는 메서드이다
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 72번에서 ViewController에서 업데이트 안되어있던 것이 이제 업데이트 된다
        // 아래 코드는 테이블 뷰를 다시 그리는 메소드
        tableView.reloadData()
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블 뷰 뒤에 있는 백그라운드 컬러 설정
        self.view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
        
        // 3
        // 오토레이아웃을 잡은 메서드를 호출해서 화면이 로드되기 전에 초기화 시키기
        setupTableViewConstraints()
        
        // 7
        // tableView의 구성하기 위해 필수 설정이 담긴 메서드를 viewDidLoad에서 호출
        setupTableView()
        
        // 14
        // 네비게이션 바를 셋팅하는 메서드를 viewDidLoad에서 호출
        setupNaviBar()
        
        // 16
        // 비즈니스 모델의 멤버 배열 데이터를 호출하는 setupDatas를 viewDidLoad에서 초기화 해주기
        setupDatas()
        
    }
    
    // 5
    // tableView의 중요한 설정이 코드 모음 메서드 만들기
    func setupTableView() {
        
        // 6
        // dataSource를 사용하기 위해서는 반드시 필수적으로 선언해야되는 코드
        // 테이블 뷰에 접근해서 데이터뷰를 셀프로 설정한다
        // ⭐️tableView.dataSource의 대리자를 ViewController로 설정하겠다는 의미⭐️
        tableView.dataSource = self
        // ⭐️필수
        tableView.delegate = self
        
        tableView.rowHeight = 60
        // 28
        // ⭐️⭐️⭐️코드로 UI를 짤경우 쎌을 등록하는 코드를 반드시 선언해야 한다⭐️⭐️⭐️
        // ⭐️첫번째 파라미터에서는 쎌의 클래스의 메타타입을 입력해야한다⭐️
        tableView.register(CodersTableViewCell.self, forCellReuseIdentifier: "MemberCell")
        
    }
    
    // 15
    // 비즈니스 모델을 접근해서 멤버 배열 데이터를 생성하는 메서드를 실행시키는 메서드 생성
    func setupDatas() {
        memberListManager.makeMemberListDatas()
    }
    
    // 13
    // 네비게이션바를 만들었으므로 네비게이션 바를 셋팅
    func setupNaviBar() {
        // 13-1
        title = "빡코더스"
        // 13-2
        // 네비게이션바 관련 설정
        let appearance = UINavigationBarAppearance()
        // 불투명 하게끔 설정
        appearance.configureWithOpaqueBackground()
        // 배경 색깔 설정
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // 76
        // 네비게이션 오른쪽 상단 버튼 설정
        self.navigationItem.rightBarButtonItem = self.plusButton
    }
    
    // 2
    // 테이블 뷰 오토레이아웃 잡기
    func setupTableViewConstraints() {
        // 테이블 뷰를 ViewController에 가장 밑바탕에 있는 뷰 위에 올리기
        self.view.addSubview(tableView)
        // 테이블 뷰의 오토레이아웃을 수동으로 잡겠다는 코드 (필수)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
    
    // 75
    // 멤버를 추가하기 위한 다음 화면으로 이동
    @objc func plusButtonTapped() {
        // 다음화면으로 이동 (멤버는 전달하지 않음)
        let detailVC = DetailViewController()
        
        // 다음 화면의 대리자 설정 (다음 화면의 대리자는 지금 현재의 뷰컨트롤러)
        //detailVC.delegate = self
        
        // push방식으로 화면이동
        navigationController?.pushViewController(detailVC, animated: true)
        //show(detailVC, sender: nil)
        
        // 멤버를 추가하기 위함이기때문에 멤버를 전달하지 않아도 된다
    }



}

// 4
// MARK: - UITableViewDataSource Delegate Extention
// 테이블 뷰를 사용하기 위해서는 반드시 UITableViewDataSource프로토콜을 채택해야 한다
extension ViewController: UITableViewDataSource {
    // 11
    // ⭐️⭐️memberListManager저장속성을 통해 MemberListManager 비즈니스 로직에 접근하여 getMemberList() 메서드를 통해 모델의 배열을 가져온후 배열의 갯수를 셀수 있는 count를 통해 Member 모델의 갯수를 반환해주므로 tableView에게 Member배열의 갯수를 리턴하여 몇개의 데이터를 표시해야되는 지를 알려준다⭐️⭐️
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return memberListManager.getMemberList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 27
        // 테이블 뷰의 register 메소드에서 등록해 놓은 쎌의 Identifier를 통해 쎌을 꺼내가지고 사용해야 한다
        // 첫뻔째 파라미터를 활용해서 쎌의 Identifier을 설정한다 두번째 파라미터에는 cellForRowAt의 파라미터를 넣어준다
        // dequeueReusableCell 메소드의 타입은 UITableViewCell 터입이기때문에 타입캐스팅을 통해서 구체적은 타입으로 변형해준다음 tableView 메서드의 지역변수인 cell에 할당해준다
        // cell를 눌렀을때 테이블뷰의 dequeueReusableCell메서드를 통해 눌린 해당 쎌이 tableView의 지역변수 cell에 전달된다
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! CodersTableViewCell
        
        // 27-1⭐️⭐️⭐️
        // cell 은 CoderstableViewCell 내가 만든 커스텀 쎌 타입이다 그러므로 cell에서 CoderstableViewCell에 있는 속성감시자 member에 접근할수 있다.
        // 눌린 쎌의 의 데이터를 memgerListManager.getMemberList()[indexPath.row]를 통해 가져오고 cell 즉 MyTableViewCell의 member에 전달한다
        cell.member = memberListManager[indexPath.row]
        
        // 27-2
        // 쎌을 눌렀을때 스타일
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}

// MARK: - UITableViewController Delegate
// 62
// 쎌을 눌렀을때 다음 화면으로 넘어가기위해서는 UITableViewDelegate 프로토콜을 채택해야한다
extension ViewController: UITableViewDelegate {
    
    // 63
    // (필수가 아닌 선택적인 메서드)
    // 쎌이 눌렀을때 메서드를 통해서 동작이 전달 된다
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 64
        // 코드를 통해서 다음화면으로 넘어가는 코드 구현
        // DetailViewController를 생성한후 detailVC에 할당
        let detailVC = DetailViewController()
        
        
        // 67
        // ⭐️⭐️memberListManager.getMemberList()를 통해 Member 배열을 얻어온후 [indexPath.row]를 통해 Member배열에 몇변째 녀석인지 접근을 해서 DetailViewController 에 전달한다⭐️⭐️
         
        detailVC.member = memberListManager.getMemberList()[indexPath.row]
        
        
        // 65
        // ⭐️ 네비게이션 컨트롤러를 사용해서 다음화면으로 넘어가는 코드
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}

