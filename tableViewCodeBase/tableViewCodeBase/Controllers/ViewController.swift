//
//  ViewController.swift
//  tableViewCodeBase
//
//  Created by Hertz on 8/27/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // (1)
    // 테이블 뷰 생성
    private let tableView = UITableView()
    
    //
    // Proflie 데이터에 접속할수 있는 변수 생성
    var profileDataManager = ProfileDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileDataManager.makeProfileData()
        setupNavigatingBar()
        setupTableView()
        setupTableviewConstraints()
    }
    
    //
    // 네비게이션 바의 외형을 설정
    func setupNavigatingBar() {
        title = "영화목록"
        
        // (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정⭐️⭐️⭐️
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setupTableView() {
        
        //
        // 델리게이트 패턴의 대리자가 뷰컨트롤러가 되겠다는 설정
        tableView.delegate = self
        tableView.dataSource = self
        
        //
        // 테이블 뷰에 있는 셀의 높이를 설정
        tableView.rowHeight = 120

        //
        // 코드로 구현할 경우 ⭐️셀의 등록과정에 반드시 필요하다⭐️ (스토리보드에서 구현할경우 스토리 보드에서 자동호출)
        // register 첫번째 파라미터로 인스턴스를 넣어주는것이 아니라 인스턴스의 메타 타입(데이터 영역에 존재하고 있는 타입인스턴스 자체)을 넣어줘야한다
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileCell")
    }
    
    func setupDatas() {
        // 일반적으로는 서버에 데이터 요청
        // profileDataManager저장속성을 이용해서 ProfileDataManager 클래스의 makeProfileData메서드 호출 해서 Profile배열 데이터를 초기화해주기
        profileDataManager.makeProfileData()
        
    }

    // 2
    // 테이블 뷰 오토레이아웃 잡기
    func setupTableviewConstraints() {
        // 2-1
        // 생성한 테이블 뷰를 ViewController위에 올리기
        self.view.addSubview(tableView)
        // 2-2
        // 테이블 뷰 오토레이아웃
        tableView.snp.makeConstraints {
            $0.top.trailing.bottom.leading.equalToSuperview().offset(0)
        }
    }
    
}

//
// MARK: - UITableViewDataSource 익스텐션
// ⭐️ UITableViewDataSource == 어떤 데이터들을 표시할것인지 에 대한 프로토콜
extension ViewController: UITableViewDataSource {
    //
    // DataSource채택시 필수 메서드
    // 몇개의 컨텐츠를 만들면 되는지 알려주는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileDataManager.getProfileData().count
    }


    // DataSource채택시 필수 메서드
    // 몇번째 행에 있는 셀은 어떠한 방식으로 표시하면 되는지 알려주는 메서드
    // 쎌을 어떻게 그릴지 뷰컨트롤러에게 계속 물어본다 == 계속 호출한다
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        // 구체적인 셀의 형태 를 지정해 줘야한다
        // dequeueReusableCell 는 기존에 만들어 놨던 셀을 꺼내는 메서드 이다
        // ⭐️ 테이블뷰의 셀의 Identifier에다가 ProfileCell을 등록해놔야지만 꺼내 쓸수 있다 ⭐️
        // indexPath는 경로를 의미한다 실제 핸드폰에서 사용자가 클릭한 위치를 indexPath 파라미터로 전달받는다
        // 위에서 tableView의 레지스터 메서드를 통해 쎌을 등록했기때문에 dequeueReusableCell 메서드를 사용할수 있다
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileTableViewCell

        // ⭐️ 쿵짝쿵짝 ⭐️
        // indexPath에는 section 이라는 개념과 row 라는 개념이 있다
        // row == 행 // section == 그룹
        cell.mainImageView.image = profileDataManager.getProfileData()[indexPath.row].profileImage
        cell.personNameLabel.text = profileDataManager.getProfileData()[indexPath.row].personName
        cell.descriptionLabel.text = profileDataManager.getProfileData()[indexPath.row].personDescription
        
        // 셀을 클릭했을때 스타일 효과
        cell.selectionStyle = .none
        
        return cell
    }


}

//
// MARK: - UITableViewDelegate 익스텐션
// ⭐️ UITableViewDelegate == 이벤트를 전달받고 일처리를 해주는 프로토콜
extension ViewController: UITableViewDelegate {
    // 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 다음화면으로 이동
        let detailVC = DetailViewController()
        detailVC.profileData = profileDataManager.getProfileData()[indexPath.row]
//        show(detailVC, sender: nil)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
