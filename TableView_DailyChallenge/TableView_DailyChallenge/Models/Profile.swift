//
//  Profile.swift
//  TableView_DailyChallenge
//
//  Created by Hertz on 8/26/22.
//

import UIKit

struct Profile {
    
    // 프로필 이미지
    // 이미지 파일이 없어서 에러가 날 경우를 대비해서 옵셔널로 설정
    var profileImage: UIImage?
    // 프로필 이름
    var personName: String
    // 프로필 상세설명
    var personDescription: String
    
    
}
