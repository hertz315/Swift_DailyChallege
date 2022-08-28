//
//  Member.swift
//  ppakcoders
//
//  Created by Hertz on 8/28/22.
//

import UIKit

// 8
// 모델 클래스 설계하기
// 상속이 필요없는 데이터 묶음 같은 경우에는 구조체로 만든다
// 클래스는 무겁고 느리다
struct Member {
    
    
    // 8-4
    // ⭐️지연 저장속성으로 선언을 한다면 해당 변수에 접근할때 메모리에 공간이 생긴다
    // 이미지가 없다면 메모리를 낭비할 필요 없기 때문이다
    // 지연저장 속성으로 선언
    lazy var memberImage: UIImage? = {
        // 저장속성 nickName이 없다면, 시스템 사람이미지 셋팅
        guard let nickName = nickName else {
            return UIImage(systemName: "Person")
        }
        // 해당 이름으로한 이름이 없다면, 시스템 사람이미지 셋팅
        return UIImage(named:  "\(nickName).png)" ) ?? UIImage(systemName: "Person")
    }()
    
    // 8-1
    // 모든 인스턴스들이 공유할수 있는 저장 속성 만들기
    static var memberNumbers: Int = 0
    
    // 8-2
    let memberId: Int
    var membership: String?
    var figmaAdress: String?
    var nickName: String?
    var consultCount: Int?
    
    // 8-3
    // 생성자 구현
    init(membership: String?, figmaAdress: String?, nickName: String?, consultCont: Int?) {
        
        // 멤버의 숫자가 0이라면 0을 셋팅, 아니라면 타입저장 속성의 절대값으로 셋팅
        self.memberId = Member.memberNumbers == 0 ? 0 : Member.memberNumbers
        
        
        self.membership = membership
        self.figmaAdress = figmaAdress
        self.nickName = nickName
        self.consultCount = consultCont
        
        
        // 멤버를 생성한다면, 항상 멤버의 숫자가 +1 증가되게끔 설정
        Member.memberNumbers += 1
        
    }
}
