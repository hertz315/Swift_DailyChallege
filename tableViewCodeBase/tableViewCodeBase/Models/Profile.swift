//
//  Profile.swift
//  tableViewCodeBase
//
//  Created by Hertz on 8/27/22.
//

import UIKit

// 1
// 프로필의 데이터 모델 설계
// ⭐️ 화면에 뿌려주기 위한 데이터가 어떤 타입인지를 설정 ⭐️
struct Profile {
    
    // 1-1
    // 프로필 이미지
    // 이미지 파일이 없어서 에러가 날 경우를 대비해서 옵셔널로 설정
    var profileImage: UIImage?
    // 프로필 이름
    var personName: String
    // 프로필 상세설명
    var personDescription: String
    
    
}
