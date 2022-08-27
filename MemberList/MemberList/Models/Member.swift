//
//  Member.swift
//  MemberList
//
//  Created by Hertz on 8/27/22.
//

import UIKit

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
    let MemberId: Int
    let name: String?
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
        self.MemberId = Member.memberNumbers == 0 ? 0 : Member.memberNumbers
        
        // 7-6
        // 멤버를 생성한다면, 항상 멤버의 숫자가 + 1 증가되게 끔 설정
        Member.memberNumbers += 1
        
        
    }
}
