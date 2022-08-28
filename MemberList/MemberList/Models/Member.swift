//
//  Member.swift
//  MemberList
//
//  Created by Hertz on 8/27/22.
//
import UIKit

// MARK: - 커스텀 프로토콜 생성
// 72-1
// 유저가 추가되거나 기존의 멤버의 정보가 업데이트 되는일은 DetailViewController내부에서 일어난다
// 업데이트가 되거나 추가가되거나 동작이 일어나면 "대리자한테 이런일이 발생했어 그러니깐 너도 무언가를 해야되" 라는 것을 알려줄수 있어야 한다
// 실제로 일은 DetailViewController에서 일어났지만 실제로 이런일이 일어났으니깐 "너는 나에 대리자의 역할로 무언가를 해야되" 라는 것을 ViewController에게 알려줘야 한다 그러므로 어떠한 동작이 일어났을대 그 동작의 결과를 전달받을수 있는 어떠한 정확한 행동을 선언을 해줘야 하니깐 프로토콜을 통해서 2가지 메서드를 선언했다
// 커스텀 델리게이트 패턴을 쓰기위해서는 첫번재로 프로토콜(자격증)을 만들어야 한다
protocol MemberDelegate: AnyObject {
    // 대리자가 하면 되는 일을 정의
    // 1. DetailViewController 에서 일어나는 일을 전달을 받으면 된다
    // 1.1 DetailViewController 에서 멤버가 추가가 되는 일이 발생할것이고 ViewController가 멤버를 쎌에 표시할것이다
    func addNewMember(_ member: Member)
    
    // 2
    // 업데이트 할려면 몇번째 멤버가 업데이트 되는줄 알아야하기때문에 반드시 인덱스가 필요하다
    func update(index: Int, _ member: Member)
}




// 7
// 상속이 필요없는 데이터 묶음 같은 경우에는
// 스터럭트로 만든다
// 클래스는 무겁고 느리다
struct Member {
    
    // 7-7
    // ⭐️지연저장 속성으로 선언을 한다면 해당변수에 접근할때 메모리에 공간이 생긴다
    // 그러므로 이미지가 없다면 메모리를 낭비할 필요 없기 때문에
    // 지연저장 속성으로 선언
    lazy var memberImage: UIImage? = {
        // 저장속성 name이 없다면, 시스템 사람이미지 셋팅
        guard let name = name else {
            return UIImage(systemName: "person")
        }
        // 해당 이름으로한 이미지가 없다면, 시스템 사람이미지 셋팅
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    // 7-1
    // 모든 인스턴스들이 공유할수 있는 저장 속성 만들기
    static var memberNumbers: Int = 0
    
    // 7-2
    let memberId: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    // 7-3
    // 생성자 구현
    init(name: String?, age: Int?, phone: String?, address: String?) {
        // 7-4
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        // 7-5
        // 멤버의 숫자가 0이라면 0을 셋팅, 아니라면 타입저장 속성의 절대적 값으로 셋팅
        self.memberId = Member.memberNumbers == 0 ? 0 : Member.memberNumbers
        
        // 7-6
        // 멤버를 생성한다면, 항상 멤버의 숫자가 + 1 증가되게 끔 설정
        Member.memberNumbers += 1
        
        
    }
}
