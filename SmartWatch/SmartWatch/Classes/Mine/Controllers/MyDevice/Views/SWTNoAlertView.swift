//
//  SWTNoAlertView.swift
//  SmartWatch
//
//  Created by 张冲 on 7/10/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

class SWTNoAlertView: UIView {

    lazy var tipLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = .center
        label.textColor = UIColor.color("888888")
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.text = "暂无日程\n点击右上角“加号”添加一个吧"
        return label
    }()
    
    lazy var iconImageView: UIImageView = {
        let img = UIImageView(frame: CGRect.zero)
        img.image = UIImage(named: "v35为空图")
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        self.addSubview(iconImageView)
        self.addSubview(tipLabel)
        
        iconImageView.snp.makeConstraints { (make) in
            make.width.equalTo(187)
            make.height.equalTo(144)
            make.centerY.equalTo(self).offset(-100)
            make.centerX.equalTo(self)
        }
        
        tipLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make
                .top.equalTo(iconImageView.snp.bottom)
        }
        
    }
    
    deinit {
        print("xiaoshuile")
    }
    
}
