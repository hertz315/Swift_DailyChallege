//
//  MemberListManager.swift
//  MemberList
//
//  Created by Hertz on 8/27/22.
//

import UIKit

// 8
// 데이터를 관리하고 비즈니스 로직을 담을수 있는 매니저같은 역할을 한다
final class MemberListManager {
    
    // 8-1
    // Member 배열을 담을수 있는 memberList 배열 생성
    private var memberList: [Member] = []
    
    // 8-2
    // ViewController 에서 이 메서드를 한번 호출을 해줘야 데이터를 생성해가지고 memberList배열에 Member데이터를 저장하는 메서드 생성
    func makeMemberListDatas() {
        memberList = [
            Member(name: "스티브", age: 7, phone: "010-9999-9999", address: "서울 강북구 삼양로"),
            Member(name: "쿡", age: 8, phone: "010-1111-1111", address: "서울 성북구 정릉로"),
            Member(name: "베조스", age: 9, phone: "010-2222-2222", address: "서울 노원구 행복로"),
            Member(name: "스티브", age: 7, phone: "010-9999-9999", address: "서울 강북구 삼양로"),
            Member(name: "쿡", age: 8, phone: "010-1111-1111", address: "서울 성북구 정릉로"),
            Member(name: "베조스", age: 9, phone: "010-2222-2222", address: "서울 노원구 행복로"),
        ]
    }
    
    // 8-3
    // 전체 멤버 리스트를 반환하는 메서드
    func getMemberList() -> [Member] {
        return memberList
    }
    
    // 8-4
    // 새로운 멤버를 만드는 메소드
    func makeNewMember(_ member: Member) {
        memberList.append(member)
    }
    
    // 8-5
    // 기존 멤버의 정보를 업데이트 해주게 하는 메소드
    func updateMemberInfo(index: Int, _ member: Member) {
        memberList[index] = member
    }
    
    // 8-6
    // indexPath를 사용하여 특정 멤버를 반환하게 해주는 메소드
    // ⭐️⭐️⭐️get Only로 구현하면 tableView의 쎌에 데이터를 넘겨줄때 값(데이터)을 넘겨줄수가 없다 그래서 set도 구현해야한다⭐️⭐️⭐️
    subscript(index: Int) -> Member {
        get {
            return memberList[index]
        }
        set {
            memberList[index] = newValue
        }
    }
    
    
}
