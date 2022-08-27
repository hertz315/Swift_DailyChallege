//
//  DataManager.swift
//  TableView_DailyChallenge
//
//  Created by Hertz on 8/26/22.
//

import UIKit

// 뷰컨트롤러가 요청했을대 배열을 전달해주는 데이터 클래스
class ProfileDataManager {
    
    // 서버랑 통신할때를 연습하는 용도로 이런식으로 설정
    var profileDataArray: [Profile] = []
    
    
    // 배열을 만드는 함수
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
    
    // 프로필 배열을 리턴하는 함수
    func getProfileData() -> [Profile] {
        return profileDataArray
    }
    
    // 프로필 데이터를 담고 있는 profile 배열에다가 Profile 데이터를 추가해주는 함수
    func updateProfileData() {
        let profile = Profile(profileImage: UIImage(named: "그룹"), personName: "모각코", personDescription: "부담없이 하기 좋은 모각코 입니다")
        profileDataArray.append(profile)
    }
    
}
