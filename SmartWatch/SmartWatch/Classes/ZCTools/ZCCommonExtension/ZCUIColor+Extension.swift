//
//  ZCUIColor+Extension.swift
//  VeepooGBand
//
//  Created by 张冲 on 2018/9/3.
//  Copyright © 2018年 zhangchong. All rights reserved.
//

import UIKit

extension UIColor {
    static func color(_ hexString: String) -> UIColor {
        let scanner = Scanner(string: hexString)
        var hexNum: uint = 0
        if scanner.scanHexInt32(&hexNum) == false {
            return UIColor.clear
        }
        return UIColor.color(hexNum)
    }
    
    static func color(_ hex: UInt32) -> UIColor {
        let r = hex >> 16 & 0xFF
        let g = hex >> 8 & 0xFF
        let b = hex & 0xFF
        return UIColor.color(Int(r), g: Int(g), b: Int(b), a: 1.0)
    }
    
    static func color(_ r: Int, g: Int, b: Int, a: Float) -> UIColor {
        return UIColor(red: CGFloat(Float(r) / 255.0), green: CGFloat(Float(g) / 255.0), blue: CGFloat(Float(b) / 255.0), alpha: CGFloat(a))
    }
    
    //重新设置color的颜色
    func resetAlpha(_ alpha: Float) -> UIColor {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var oldAlpha: CGFloat = 0.0
        self.getRed(&red, green: &green, blue: &blue, alpha: &oldAlpha)
        let newColor = UIColor(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
        return newColor;
    }
    
}
