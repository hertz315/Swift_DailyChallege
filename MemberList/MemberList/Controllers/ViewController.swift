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
        // ⭐️tableView.dataSource의 대리자를 ViewController로 설정하겠다는 의미이다⭐️
        tableView.dataSource = self
        
        // 5-2
        // 테이블 뷰의 높이 설정
        tableView.rowHeight = 60
        
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
        return UITableViewCell()
    }
    
    
}
