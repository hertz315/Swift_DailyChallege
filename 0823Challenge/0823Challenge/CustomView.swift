//
//  CustomView.swift
//  0823Challenge
//
//  Created by Hertz on 8/23/22.
//

import UIKit

// 인터페이스 빌더에서 디자인을 확인 가능 하게끔 해주는 어트리뷰트
@IBDesignable
class CustomView: UIView {
    
    // 스토리보드 인스펙터 패널에서 GUI로 속성을 설정할수있게끔 도와주는 어트리뷰트
    @IBInspectable
    // 퍼리퍼티가 값이 설정 되면 didSet(로직)이 실행됨
    var cornerRadius: CGFloat = 0 {
        didSet {
            
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    // 퍼리퍼티가 값이 설정 되면 didSet(로직)이 실행됨
    var borderWitdh: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWitdh
        }
    }
    
    @IBInspectable
    // 퍼리퍼티가 값이 설정 되면 didSet(로직)이 실행됨
    var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    // 퍼리퍼티가 값이 설정 되면 didSet(로직)이 실행됨
    var isCircle: Bool = false {
        didSet{
            if isSquare && isCircle {
                self.layer.cornerRadius = self.frame.width / 2
            }
        }
    }
    
    // fileprivate 접근제어자는 클래스 안에서만 사용할때 사용한다 외부에서는 접근 불가
    /// 뷰 정사각형 여뷰
    /// - Returns: 정사각형 여부
    fileprivate var isSquare: Bool {
        get {
            return self.frame.width == self.frame.height
        }
    }
    
    @IBInspectable
    var hasShadow: Bool = false {
        didSet {
            if hasShadow {
                layer.applyShadow()
            }
        }
    }
    
}
