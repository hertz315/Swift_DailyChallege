//
//  ViewController.swift
//  TableView_DailyChallenge
//
//  Created by Hertz on 8/26/22.
//

import UIKit


class ViewController: UIViewController {
    
    // 데이터 매니저 생성
    // 데이터를 접속할수 있는 변수 설정
    var profileDataManager = ProfileDataManager()
    
    // 테이블 뷰 연결
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // ⭐️⭐️ 데이터는 실제로 ProfileDataManager 클래스 에서 가지고 있다 ⭐️⭐️
        // ⭐️⭐️ ProfileDataManager클래스 를 현재위치의(ViewController) 클래스의 저장속성에 할당한후 저장속성을 통해 ProfileDataManager클래스의 속성에 접근하여 makeProfileData함수를 통해 Profile배열 데이터를 가져오기 ⭐️⭐️
        profileDataManager.makeProfileData()
        
        // ⭐️ dataSource 채택 ⭐️
        // tableView에 대리자가 뷰컨트롤러가 대겠다는 의미
        tableView.dataSource = self
        
        // ⭐️ delegate 채택 ⭐️
        // tableView에 대리자가 뷰컨트롤러가 대겠다는 의미
        tableView.delegate = self
        
        // tableView 의 셀의 높이 설정
        tableView.rowHeight = 120
        
    }
    
    // add 버튼을 누르면 함수 실행
    // add 버튼을 누르면 Profile 배열이 늘어놔야된다
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        // add 버튼을 눌르면 profileDataManager 저장속성에 ProfileDataManager 클래스가 할당되어있으니깐 profileDataManager 저장속성을 통해 ProfileDataManager클래스의 updataProfileData메서드로 접근해서
        // Profile 데이터를 생성하고 Profile 배열에 추가한다
        profileDataManager.updateProfileData()
        
        // ⭐️ 이제 데이터가 tableView의 데이터가 바뀌었으니깐 테이블 뷰 다시 표시해주는 메서드 ⭐️
        tableView.reloadData()
    }
    
}

// MARK: - UITableViewDataSource 익스텐션
// ⭐️ UITableViewDataSource == 어떤 데이터들을 표시할것인지 에 대한 프로토콜
extension ViewController: UITableViewDataSource {
    
    // DataSource채택시 필수 메서드
    // 몇개의 컨텐츠를 만들면 되는지 알려주는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // ⭐️ profileArray 컨텐츠가 담겨져 있는 갯수를 리턴
        print(#function)
        return profileDataManager.getProfileData().count
    }
    
    // DataSource채택시 필수 메서드
    // 몇번째 행에 있는 셀은 어떠한 방식으로 표시하면 되는지 알려주는 메서드
    // 쎌을 어떻게 그릴지 뷰컨트롤러에게 계속 물어본다 == 계속 호출한다
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        // 구체적인 셀의 형태
        // 기존에 만들어 놨던 셀을 꺼내는 메서드 == dequeueReusableCell
        // ⭐️ 테이블뷰의 셀의 Identifier에다가 ProfileCell을 등록해놔야지만 꺼내 쓸수 있다 ⭐️
        // IndexPath == 경로
        // for 파라미터 == 몇번째 경로에 있는 쎌을 꺼낼 것인지
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileTableViewCell
        
        // ⭐️ 쿵짝쿵짝 ⭐️
        // indexPath에는 section 이라는 개념과 row 라는 개념이 있다
        // row == 행 // section == 그룹
        cell.mainImageView.image = profileDataManager.getProfileData()[indexPath.row].profileImage
        cell.personName.text = profileDataManager.getProfileData()[indexPath.row].personName
        cell.descriptionLabel.text = profileDataManager.getProfileData()[indexPath.row].personDescription
        
        // 셀을 클릭했을때 스타일 효과
        cell.selectionStyle = .none
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate 익스텐션
// ⭐️ UITableViewDelegate == 이벤트를 전달받고 일처리를 해주는 프로토콜
extension ViewController: UITableViewDelegate {
    
    // ⭐️⭐️ 테이블 뷰 위에있는 쎌이 선턱되었을때 ⭐️⭐️
    // ⭐️ 내부적으로 몇번째 쎌이 터치되어있는지는 indexPath가 알려준다 ⭐️
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // ⭐️ 스토리보드로 세그웨이를 만들었을때 화면을 넘길수 있는 방식 ⭐️
        performSegue(withIdentifier: "toDetail", sender: indexPath)
        
    }
    
    // ⭐️⭐️⭐️ 다음 화면으로 갈때 데이터를 전달해야한다 ⭐️⭐️⭐️
    // ⭐️⭐️⭐️ 스토리보드를 통해서 다음 화면으로 데이터를 전달할때 항상 prepare 세그웨이 메서드를 제정의 해서 전달 할수 있다 ⭐️⭐️⭐️
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // prepare 세그웨이 에서는 먼저 Identifier를 확인해야 한다
        if segue.identifier == "toDetail" {
            // destination은 UIViewController 타입이다 그래서 타입캐스팅을 해줘야 한다
            let detialVC = segue.destination as! DetailViewController
            
            // profileDataManager를 통해 배열을 받아 온 다음에 변수에 저장
            let array = profileDataManager.getProfileData()
            
            // 매우 중요 //
            // ⭐️⭐️⭐️
            // 배열에서 몇번째 녀석인지를 꺼내서 다음화면에 표시할 데이터를 전달한다
            // prepare 메소드는 indexPath 파라미터가 없다 그래서 didSelectRowAt 를 통해서 전달받아야 한다
            // 그렇게 하기 위해서는 performSegue메서드 sender 파라미터에서 indexPath를 전달받아야 한다
            // performSegue 메서드의 sender에서 indexPath를 전달하면
            // prepare 메소드를 실행할때 prepare 파라미터 sender에서
            // performSegue메서드의 indexPath를 전달받을수 있다
            
            // 전달을 받은 indexPath를 꺼내야한다
            // sender를 IndexPath타음으로 타입캐스팅을 해야한다
            // ⭐️⭐️⭐️
            let indexPath = sender as! IndexPath
            
            // Profile 배열에서 몇번째 녀석인지를 정확히 꺼내서 다음화면으로 전달한다
            detialVC.profileData = array[indexPath.row]
        }
    }
    
    // 테이블 뷰 위에있는 쎌이 선택되었던게 취소 되었을때
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    // 쎌이 하이라이트 되었을때
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
    }
    
}
