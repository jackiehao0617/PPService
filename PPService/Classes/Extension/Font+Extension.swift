//
//  Font+Extension.swift
//  Pods-PPService_Example
//
//  Created by 郝鹏飞 on 2022/4/26.
//

import Foundation

public extension UIFont {
    enum FontType: String {
        case light = "PingFangSC-Light"
        case regular = "PingFangSC-Regular"
        case medium = "PingFangSC-Medium"
        case bold = "PingFangSC-Semibold"
    }
    
    static func pp_light(size: CGFloat) -> UIFont {
        return pp_font(type: .light, size: size)
    }
    
    static func pp_regular(size: CGFloat) -> UIFont {
        return  pp_font(type: .regular, size: size)
    }
    
    static func pp_font(type: FontType, size: CGFloat) -> UIFont {
        return UIFont(name: type.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
