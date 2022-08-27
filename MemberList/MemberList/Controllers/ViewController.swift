//
//  ViewController.swift
//  MemberList
//
//  Created by Hertz on 8/27/22.
//

import UIKit

final class ViewController: UIViewController {

    // 1
    // 테이블 뷰 생성 하기
    private let tableView = UITableView()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 3
        // 오토레이아웃 잡은 메서드를 호출해서 화면이 로드되기 전에 초기화 시키기
        setupTableViewConstraints()
        
        // 5
        // dataSource를 사용하기 위해서는 반드시 필수로
        // 테이블 뷰에 접근해서 데이터뷰를 셀프로 설정한다
        // ⭐️tableView.dataSource의 대리자를 ViewController로 설정하겠다는 의미이다⭐️
        tableView.dataSource = self
        
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
        return 5
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
