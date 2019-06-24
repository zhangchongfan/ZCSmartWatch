//
//  ZCNumber+Change.swift
//  VeepooGBand
//
//  Created by 张冲 on 2018/9/6.
//  Copyright © 2018年 zhangchong. All rights reserved.
//

import UIKit

extension Int {
    
    func cgFloat() -> CGFloat {
        return CGFloat(self)
    }

    func double() -> Double {
        return Double(self)
    }

    func float() -> Float {
        return Float(self)
    }

    func number() -> NSNumber {
        return NSNumber(value: self)
    }

    func int() -> Int {
        return Int(self)
    }
    
}

extension Float {
    func cgFloat() -> CGFloat {
        return CGFloat(self)
    }
    
    func double() -> Double {
        return Double(self)
    }
    
    func float() -> Float {
        return Float(self)
    }
    
    func number() -> NSNumber {
        return NSNumber(value: self)
    }
    
    func int() -> Int {
        return Int(self)
    }
}

extension Double {
    func cgFloat() -> CGFloat {
        return CGFloat(self)
    }
    
    func double() -> Double {
        return Double(self)
    }
    
    func float() -> Float {
        return Float(self)
    }
    
    func number() -> NSNumber {
        return NSNumber(value: self)
    }
    
    func int() -> Int {
        return Int(self)
    }
}

extension CGFloat {
    func cgFloat() -> CGFloat {
        return CGFloat(self)
    }
    
    func double() -> Double {
        return Double(self)
    }
    
    func float() -> Float {
        return Float(self)
    }
    
    func number() -> NSNumber {
        return NSNumber(value: self.float())
    }
    
    func int() -> Int {
        return Int(self)
    }
}
