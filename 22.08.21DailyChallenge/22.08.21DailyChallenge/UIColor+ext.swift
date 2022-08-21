//
//  UIColor+ext.swift
//  22.08.21DailyChallenge
//
//  Created by Hertz on 8/21/22.
//

import UIKit

extension UIColor {
    @nonobjc class var dark: UIColor {
        return UIColor(red: 30.0 / 255.0, green: 35.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var border: UIColor {
        return UIColor(red: 232.0 / 255.0, green: 236.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var gray: UIColor {
        return UIColor(red: 131.0 / 255.0, green: 145.0 / 255.0, blue: 161.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var darkGray: UIColor {
        return UIColor(red: 106.0 / 255.0, green: 112.0 / 255.0, blue: 124.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var dividerLight1Px60: UIColor {
        return UIColor(white: 228.0 / 255.0, alpha: 0.6)
    }
    @nonobjc class var colorsPrimaryGreen: UIColor {
        return UIColor(red: 0.0, green: 196.0 / 255.0, blue: 140.0 / 255.0, alpha: 1.0)
    }
}
