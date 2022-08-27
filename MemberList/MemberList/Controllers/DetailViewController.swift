//
//  DetailViewController.swift
//  MemberList
//
//  Created by Hertz on 8/27/22.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // 55
    // 디테일 뷰를 를 DetailViewController의 뷰로 교체하기 위해 속성을 선언한다
    private let detailView = DetailView()
    
    // 57
    // MyTableViewCell에서 터치이벤트를 통해 데이터를 넘겨받을 수 있게하기 위해 저장속성 선언하기
    var member: Member?
    
    // 56
    // ⭐️viewDidLoad보다 더먼저 호출되는 loadView에서 뷰를 교체해주기
    // ⭐️loadView를 사용할때 super키워드를 통해 재정의 해줄 필요가 없다
    override func loadView() {
        self.view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 60
        // ⭐️viewDidLoad에서 setupButtonAction메서드를 한번 호출해야 타겟이 설정 된다⭐️
        setupButtonAction()
        // 71
        // viewDidLoad에서 멤버를 전달해야한다 그렇게 하기위해 멤버를 전달하는 코드가 있는 setupData()를 viewDidLoad에서 호출한다
        setupData()
    
    }
    
    // 69
    private func setupData() {
        // ⭐️⭐️⭐️⭐️⭐️70⭐️⭐️⭐️⭐️⭐️
        // DetailViewController에 선언된 Member타입 저장속성 member를 detialView의 속성감시자 member변수에 전달을 해줘야 detailView에 있는 member변수의 didSet이 동작을 할것이고 didSet이 동작을 하면 member와 관련된 데이터정보를 뷰에서 표시를 해줄수 있다
        // 결론적으로 UITableViewDelegate didSelectRowAt메서드를 통해 테이블뷰를 가지고 있는 ViewController에서 쎌을 클릭했을때 detailVC.member 를 통해 Member 데이터가 DetailViewController으로 넘어올것이고 넘어올때  member 변수를 통해 Member를 전달받으면 detailView.member를 통해 DetailView에서 멤버를 전달 받을 것이고 DetailView에 있는 멤버 속성감시자를 통해서 변경된 내용 통해 뷰의 요소를 업데이트 한다
        detailView.member = member
    }
    
    
    // 59
    // 버튼이 눌렸을때 동작을 해야하는데 일반적으로 버튼이 눌렸을때 동작을 하는건 뷰컨트롤러에서 구현해줘야 한다
    // ⭐️뷰에서는 present메서드가 없기 때문이다⭐️
    // 버튼에 다한 타겟을 뷰 컨트롤러에서 설정해야한다
    // ⭐️뷰에있는 버튼의 타겟 설정⭐️
    func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    // 58
    @objc func saveButtonTapped() {
        print(#function)
    }
}
