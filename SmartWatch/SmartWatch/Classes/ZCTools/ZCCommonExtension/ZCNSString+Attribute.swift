//
//  ZCNSString+Attribute.swift
//  VeepooGBand
//
//  Created by 张冲 on 2018/9/3.
//  Copyright © 2018年 zhangchong. All rights reserved.
//

import UIKit

extension String {
    
    //设置富文本，带有下划线的
    func attributedString(_ textColor: UIColor, fontSize: Float, lineSpace: Float, lineColor: UIColor) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        let length = attributedString.length
        let range: NSRange = NSMakeRange(0, length)
        attributedString
            .addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: CGFloat(fontSize)), range: range)
        attributedString
            .addAttribute(NSAttributedString.Key.foregroundColor, value: textColor, range: range)

        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = CGFloat(lineSpace)
        
        attributedString
            .addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)

        attributedString
            .addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        
        return attributedString
    }
    
}
