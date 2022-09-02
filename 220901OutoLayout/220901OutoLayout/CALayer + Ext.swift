//
//  CALayer + Ext.swift
//  220901OutoLayout
//
//  Created by Hertz on 9/1/22.
//

import UIKit

extension CALayer {
    
    /// 그림자 적용
    /// - Parameters:
    ///   - color: 그림자 색깔
    ///   - alpha: 그림자 투명도
    ///   - x: 가로위치
    ///   - y: 세로위치
    ///   - blur: 불러
    ///   - spread: 퍼짐정도
  func applyShadow(
    color: UIColor = .black,
    alpha: Float = 0.5,
    x: CGFloat = 0,
    y: CGFloat = 2,
    blur: CGFloat = 4,
    spread: CGFloat = 0)
  {
    masksToBounds = false
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2.0
    if spread == 0 {
      shadowPath = nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
}
