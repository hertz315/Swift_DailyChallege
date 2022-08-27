//
//  DetailViewController.swift
//  MemberList
//
//  Created by Hertz on 8/27/22.
//

import UIKit
// 77
import PhotosUI

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
    
    // 80
    func setupImagePicker() {
        // 기본설정 셋팅
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images, .videos])
        
        // 기본설정을 가지고, 피커뷰컨트롤러 생성
        let picker = PHPickerViewController(configuration: configuration)
        // 피커뷰 컨트롤러의 대리자 설정
        picker.delegate = self
        // 피커뷰 띄우기
        self.present(picker, animated: true, completion: nil)
    }
    
    // 58
    @objc func saveButtonTapped() {
        print(#function)
        
        // 네비게이션 바의 플러스 버튼을 눌렸을때 멤버가 없을때 if 블록을 실행
        // ⭐️(72-1) 멤버가 없다면 (새로운 멤버를 추가하는 화면)
        if member == nil {
            // 입력이 안되어 있다면.. (일반적으로) 빈문자열로 저장
            let name = detailView.nameTextField.text ?? ""
            let age = Int(detailView.ageTextField.text ?? "")
            let phoneNumber = detailView.phoneNumberTextField.text ?? ""
            let address = detailView.addressTextField.text ?? ""
            
            // 새로운 멤버 (구조체) 생성
            var newMember =
            Member(name: name, age: age, phone: phoneNumber, address: address)
            newMember.memberImage = detailView.mainImageView.image
            
            // 1) 델리게이트 방식이 아닌 구현⭐️
            let index = navigationController!.viewControllers.count - 2
            // 전 화면에 접근하기 위함
            let vc = navigationController?.viewControllers[index] as! ViewController
            // 전 화면의 모델에 접근해서 멤버를 추가
            vc.memberListManager.makeNewMember(newMember)
            
            
            // 2) 델리게이트 방식으로 구현⭐️
            //delegate?.addNewMember(newMember)
            
            
        // ⭐️⭐️⭐️⭐️⭐️72⭐️⭐️⭐️⭐️⭐️
        // 버튼을 누르면 전화면으로 돌아가야되고 유저에 대한 데이터가 업데이트가 되야한다
        // 멤버가 있다면 (멤버의 내용을 업데이트 하기 위한 설정)
        } else {
            // 이미지뷰에 있는 것을 그대로 다시 멤버에 저장
            member!.memberImage = detailView.mainImageView.image
            // 멤버아이디 같은경우 에만 따라 상수를 만들었다 왜냐면 왜냐면 Member Model에다가 멤버업데이트를 하기위해서는
            // 몇번째 멤버인지 알아야하기 때문에 인덱스 역할을 시킬려고 다시 상수에 담는다
            let memberId = Int(detailView.memberIdTextField.text!) ?? 0
            // detailView에 있는 속성감시자 member변수를 통해 들어온 데이터로 인해 데이터 값이 바뀐다면 현재 DetailViewController위치에있는 저장속성 member의 에 접근하여 바뀐 detialView의 요소들을 현재 위치의 member 멤버 변수에 다시 할당을 해주고 있다
            member!.name = detailView.nameTextField.text ?? ""
            member!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            member!.phone = detailView.phoneNumberTextField.text ?? ""
            member!.address = detailView.addressTextField.text ?? ""
            
            // 뷰에도 바뀐 멤버를 전달 (뷰컨트롤러 ==> 뷰)
            detailView.member = member
            
            // 1) 델리게이트 방식이 아닌 구현⭐️
            
            // 배열에 접근해서 카운트로 해보면 2가 들어있다 왜냐면 ViewController,DetailController 2개가 들어있기때문이다 2 - 2 == 0 이고 navigationController.viewControllers 배열의 0 은 ViewController화면이다\
            // 가장 마지막에 있는 화면이 count - 1이다 그래서 바로 전화면은 count - 2이다
            let index = navigationController!.viewControllers.count - 2
            
            // 전 화면에 접근하기 위함
            // ⭐️⭐️⭐️⭐️⭐️전화면에 접근하기 위해서는⭐️⭐️⭐️⭐️⭐️
            // 네비게이션컨트롤러를 사용해서 전화면에서 지금화면으로 넘어왔기때문에 네비게이션컨트롤러가 전화면의 정보를 가지고 있다
            // 네비게이션컨트롤러 라는게 화면위 에 계속 화면을 올리는 스택자료구조 방식으로 동작을 한다
            // navigationController?.viewControllers는 UIViewController타입의 배열로 관리된다
            // 배열에 접근해보면 당연히 전화면에 접근할수 있다
            // viewControllers[index]는 UIViewController타입이기 때문에 정확한 전화면에 접근하기 위해서는 전화면의 클래스로 타입캐스팅을 해야한다
            let vc = navigationController?.viewControllers[index] as! ViewController
            // 전 화면의 모델에 접근해서 멤버를 업데이트
            // 다시 할당 받아 업데이트된 member변수의 정보를 다시 전화면에 있는 Member비즈니스모델을 관리하는 memberListManager를 통해 updateMemberInfo메서드를 실행해서 멤버아이디랑 바뀐 멤버의 정보를 가지고 업데이트 한다
            vc.memberListManager.updateMemberInfo(index: memberId, member!)
            
            
            // 72
            // 델리게이트 방식으로 구현⭐️
            //delegate?.update(index: memberId, member!)
        }
        
        // (일처리를 다한 후에) 전화면으로 돌아가기
        self.navigationController?.popViewController(animated: true)

        
    }
}

// 78
//MARK: - 피커뷰 델리게이트 설정
// 피커뷰를 사용하기 위해 PHPPickerViewControllerDelegate 프로토콜 채택
extension DetailViewController: PHPickerViewControllerDelegate {
    
    // 79
    // 사진이 선택이 된 후에 호출되는 메서드
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // 피커뷰 dismiss
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    // 이미지뷰에 표시
                    self.detailView.mainImageView.image = image as? UIImage
                }
            }
        } else {
            print("이미지 못 불러왔음!!!!")
        }
    }
}
