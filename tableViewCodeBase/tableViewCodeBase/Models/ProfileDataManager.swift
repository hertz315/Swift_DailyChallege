//
//  ProfileDataManager.swift
//  tableViewCodeBase
//
//  Created by Hertz on 8/27/22.
//

import UIKit

// 2
// Profile 데이터 모델을 가공할수 있는 ProfileDataManager 생성
// ⭐️ 뷰컨트롤러가 요청했을대 배열을 전달해주는 데이터 클래스 ⭐️
class ProfileDataManager {
    
    // 2-1
    // 서버랑 통신할때를 연습하는 용도로 이런식으로 설정
    // profileDataArray이라는 Profile배열 타입의 빈 배열을 생성
    var profileDataArray: [Profile] = []
    
    // 2-2
    // profileDataArray배열을 초기화하는 makeProfileData메서드 생성
    func makeProfileData() {
            profileDataArray = [
                Profile(profileImage: UIImage(named: "메로나.png"), personName: "올때 메로나님", personDescription: "강하다"),
                Profile(profileImage: UIImage(named: "후니"), personName: "후니님", personDescription: "강하다"),
                Profile(profileImage: UIImage(named: "망고"), personName: "하얀망고님", personDescription: "강하다"),
                Profile(profileImage: UIImage(named: "헤르츠"), personName: "헤르츠님", personDescription: "강하다"),
                Profile(profileImage: UIImage(named: "그룹.png"), personName: "모각코", personDescription: "부담없이 하기 좋은 모각코"),
                Profile(profileImage: UIImage(named: "메로나.png"), personName: "올때 메로나님", personDescription: "강하다"),
                Profile(profileImage: UIImage(named: "후니"), personName: "후니님", personDescription: "강하다"),
                Profile(profileImage: UIImage(named: "망고"), personName: "하얀망고님", personDescription: "강하다"),
                Profile(profileImage: UIImage(named: "헤르츠"), personName: "헤르츠님", personDescription: "강하다"),
                Profile(profileImage: UIImage(named: "그룹.png"), personName: "모각코", personDescription: "부담없이 하기 좋은 모각코"),
                Profile(profileImage: UIImage(named: "메로나.png"), personName: "올때 메로나님", personDescription: "강하다"),
                Profile(profileImage: UIImage(named: "후니"), personName: "후니님", personDescription: "강하다"),
                Profile(profileImage: UIImage(named: "망고"), personName: "하얀망고님", personDescription: "강하다"),
                Profile(profileImage: UIImage(named: "헤르츠"), personName: "헤르츠님", personDescription: "강하다"),
                Profile(profileImage: UIImage(named: "그룹.png"), personName: "모각코", personDescription: "부담없이 하기 좋은 모각코"),
                
            ]
    }
    
    // 2-3
    // 프로필 배열을을 반환하는 메서드 설정 반환값은 현재위치의 클래스의 Profile 배열 타입의 저장속성인 profileDataArray
    func getProfileData() -> [Profile] {
        return profileDataArray
    }
    
    // 2-4
    // 프로필 모델의 데이터를 담을수 있는 updateProfileData지역변수 profile을 생성한후
    // Profile 모델을 할당 그후 append 키워드를 이용해서 profileDataArray에다가 할당
    // Profile 배열을 를 담고 있는 profileDataArray 배열에다가 Profile타입 데이터를 추가해주는 메서드
    func updateProfileData() {
        let profile = Profile(profileImage: UIImage(named: "그룹"), personName: "모각코", personDescription: "부담없이 하기 좋은 모각코 입니다")
        profileDataArray.append(profile)
    }
    
}

