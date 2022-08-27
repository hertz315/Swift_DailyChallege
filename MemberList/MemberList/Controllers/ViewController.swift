//
//  ViewController.swift
//  MemberList
//
//  Created by Hertz on 8/27/22.
//

import UIKit

final class ViewController: UIViewController {
    
    // 9
    // ⭐️멤버 데이터 비즈니스로직을 담당하고 있는 MemberListManager한테 ViewController 에서 접근하게 할수 있게끔 저장속성을 선언한후 저장속성을 MemberListManager 객체로 만들기⭐️
    var memberListManager = MemberListManager()
    

    // 1
    // 테이블 뷰 생성 하기
    private let tableView = UITableView()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // 15
        // 테이블 뷰 뒤에 있는 백그라운드 컬러가 하얗게 설정
        self.view.backgroundColor = .white
        
        // 14
        // 비즈니스 모델의 멤버 배열 데이터를 호출하는 setupDatas를 viewDidLoad에서 호출
        setupDatas()
        
        // 3
        // 오토레이아웃 잡은 메서드를 호출해서 화면이 로드되기 전에 초기화 시키기
        setupTableViewConstraints()
        
        // 12
        // 네비게이션 바를 셋팅하는 메서드를 ViewDidLoad에서 호출
        setupNaviBar()
        
        // 5
        // tableView의 중요한 설정이 담겨있는 메서드를 viewDidLoad에서 호출
        setupTableView()
        
        
    }
    
    // 5
    // tableView의 중요한설정이 담겨있는 메서드
    func setupTableView() {
        
        // 5-1
        // dataSource를 사용하기 위해서는 반드시 필수적으로 선언해야되는 코드
        // 테이블 뷰에 접근해서 데이터뷰를 셀프로 설정한다
        // ⭐️tableView.dataSource의 대리자를 ViewController로 설정하겠다는 의미⭐️
        tableView.dataSource = self
        
        // 63
        // ⭐️ViewController에서 UITableViewDelegate를 사용하기 위한 필수 요소⭐️
        // tableView.delegate의 대리자를 ViewController로 설정하겠다는 의미
        tableView.delegate = self
        
        // 5-2
        // 테이블 뷰의 높이 설정
        tableView.rowHeight = 60
        
        // 28
        // ⭐️⭐️⭐️코드로 UI를 짤경우 쎌을 등록하는 코드를 반드시 코딩해야 한다⭐️⭐️⭐️
        // ⭐️첫번째 파라미터에서는 쎌의 클래스의 메타타입을 입력해야한다⭐️
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MemberCell")
    }
    
    // 13
    // 비즈니스 모델을 접근해서 멤버 배열 데이터를 생성하는 메서드를 실행 시키는 메서드를 생성
    func setupDatas() {
        memberListManager.makeMemberListDatas()
    }
    
    // 11
    // 네비게이션바를 만들었으므로 네비게이션 바를 셋팅
    func setupNaviBar() {
        // 11-1
        title = "회원 목록"
        
        // 11-2
        // 네비게이션 관련 설정
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // 2
    // 테이블 뷰 오토레이아웃 잡기
    func setupTableViewConstraints() {
        // 테이블 뷰를 ViewController에 가장 밑바탕에 있는 뷰 위에 올리기
        self.view.addSubview(tableView)
        // ⭐️테이블 뷰 의 오토레이아웃을 수동으로 잡겠다는 코드 (필수 사항)⭐️
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }


}

// MARK: - UITableViewDataSource Delegate
// 4
// 테이블 뷰를 사용하기 위해서는 반드시 UITableViewDataSource프로토콜을 사용해야한다
// ViewController를 익스텐션 하여 UITableViewDataSource프로토콜 정의하기
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 10
        // ⭐️⭐️memberListManagermemberListManager저장속성을 통해 MemberListManager 비즈니스 로직에 접근하여 getMemberList() 메서드를 통해 모델의 배열을 가져온후 배열의 갯수를 셀수 있는 count를 통해 Member 모델의 갯수를 반환해주므로 tableView에게 Member배열의 갯수를 리턴하여 몇개의 데이터를 표시해야되는 지를 알려준다⭐️⭐️
        return memberListManager.getMemberList().count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 27
        // 테이블 뷰의 register 메소드에서 등록해 놓은 쎌의 Identifier를 통해 쎌을 꺼내가지고 사용해야 한다
        // 첫뻔째 파라미터를 활용해서 쎌의 Identifier을 설정한다 두번째 파라미터에는 cellForRowAt의 파라미터를 넣어준다
        // dequeueReusableCell 메소드의 타입은 UITableViewCell 터입이기때문에 타입캐스팅을 통해서 구체적은 타입으로 변형해준다음 tableView 메서드의 지역변수인 cell에 할당해준다
        // cell를 눌렀을때 테이블뷰의 dequeueReusableCell메서드를 통해 눌린 해당 쎌이 tableView의 지역변수 cell에 전달된다
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MyTableViewCell
        
        // 27-1⭐️⭐️⭐️
        // cell 은 MytableViewCell 내가 만든 커스텀 쎌 타입이다 그러므로 cell에서 MytableViewCell에 있는 속성감시자 member에 접근할수 있다.
        // 눌린 쎌의 의 데이터를 memgerListManager.getMemberList()[indexPath.row]를 통해 가져오고 cell 즉 MyTableViewCell의 member에 전달한다
        cell.member = memberListManager.getMemberList()[indexPath.row]
        
        // 27-2
        // 쎌을 눌렀을때 스타일
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate
// 61
// 쎌을 눌렀을때 다음 화면으로 넘어가기위해서는 UITableViewDelegate 프로토콜을 채택해야한다
extension ViewController: UITableViewDelegate {

    // 62
    // 필수가 아닌 선택적인 메서드
    // 테이블 뷰 에서 셀이 선택되었을때
    // 쎌이 눌렀을때 메서드를 통해서 동작이 전달 된다
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 64
        // 코드를 통해서 다음화면으로 넘어가는 코드 구현
        let detailVC = DetailViewController()
        
        // 67
        // 멤버를 전달
        // memberListManager.getMemberList()를 통해 Member 배열을 얻어온후 [indexPath.row]를 통해 Member배열에 접근해가지고 몇변째 녀석인지 접근을 해서 DetailViewController 에 전달한다
        detailVC.member = memberListManager.getMemberList()[indexPath.row]
        
        
        // 65
        // 네비게이션 컨트롤러를 사용해서 다음화면으로 넘어갈것이다
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}

