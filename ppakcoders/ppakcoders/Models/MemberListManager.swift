//
//  MemberListManager.swift
//  ppakcoders
//
//  Created by Hertz on 8/28/22.
//

import UIKit

// 9
// 모델 데이터를 관리하고 비즈니스 로직을 담을수 있는 데이터관리자 설정
final class MemberListManager {
    
    // 9-1
    // Member 배열을 담을수 있는 MemberList 배열을 생성
    private var memberList: [Member] = []
    
    // 9-2
    // viewController 에서 이 메서드를 한번 호출을 해줘서 데이터를 생성해줘야 한다
    // memberList 배열에 데이터를 저장하는 메서드 생성
    func makeMemberListDatas() {
        memberList = [
            Member(membership: "진성빡코더", figmaAdress: "hertz315@gmail.com", nickName: "정대리", consultCont: 3),
            Member(membership: "진성빡코더", figmaAdress: "hertz315@gmail.com", nickName: "헤르츠", consultCont: 1),
            Member(membership: "진성빡코더", figmaAdress: "hertz315@gmail.com", nickName: "메로나", consultCont: 4),
            Member(membership: "진성빡코더", figmaAdress: "hertz315@gmail.com", nickName: "엨코", consultCont: 2),
            Member(membership: "진성빡코더", figmaAdress: "hertz315@gmail.com", nickName: "마카롱", consultCont: 5),
            
        ]
    }
    
    // 9-3
    // 전체 멤버 리스트를 반환하는 메서드
    func getMemberList() -> [Member] {
        return memberList
    }
    
    // 9-4
    // 새로운 멤버를 만드는 메소드
    func makeNewMember(_ member: Member) {
        memberList.append(member)
    }
    
    // 9-5
    // 기존 멤버의 정보를 업데이트 해주게 하는 메소드
    func updateMemberInfo(index: Int, _ member: Member) {
        memberList[index] = member
    }
    
    // 9-6
    // indexPath를 사용하여 특정 멤버를 반환하게 해주는 메소드
    // ⭐️⭐️⭐️get Only로 구현하면 tableView의 쎌에 데이터를 넘겨줄때 값(데이터)을 넘겨줄수가 없다 그래서 set도 구현해야한다⭐️⭐️⭐️
    subscript(index: Int) -> Member {
        get {
            return memberList[index]
        }
    }
}
