//
//  SWTMyDeviceHeaderView.swift
//  SmartWatch
//
//  Created by 张冲 on 6/26/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

class SWTMyDeviceHeaderView: UIView {

    lazy var deviceIcon: UIImageView = {
        let img = UIImageView(frame: CGRect.zero)
        img.image = UIImage(named: "v32设备图")
        return img;
    }()
    
    lazy var deviceNameLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont.init(name: "PingFang SC", size: 30)
        label.text = "UFitSmart"
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var batteryLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont.init(name: "PingFang SC", size: 15)
        label.text = "电池电量: 15%"
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    
    lazy var connectStateLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont.init(name: "PingFang SC", size: 12)
        label.textAlignment = .right
        label.text = "已连接"
        label.textColor = UIColor(white: 1, alpha: 1)
        return label
    }()
    
    lazy var macLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont.init(name: "PingFang SC", size: 12)
        label.textAlignment = .right
        label.text = "MAC号：D1:13:D3:71:94:96"
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    
    lazy var connectBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("连接设备", for: .normal)
        btn.setTitleColor(
            SWTAppCommonColor.appMainColor(),
            for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = UIColor.white
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createMyDeviceHeaderViewUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createMyDeviceHeaderViewUI() {
        backgroundColor = UIColor.white
        let backgroundView = UIView(frame: CGRect.zero)
        backgroundView.backgroundColor = SWTAppCommonColor.appMainColor()
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.masksToBounds = true
        addSubview(backgroundView)
        
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15))
        }
        
        backgroundView.addSubview(deviceIcon)
        backgroundView.addSubview(deviceNameLabel)
        backgroundView.addSubview(batteryLabel)
        backgroundView.addSubview(connectStateLabel)
        backgroundView.addSubview(macLabel)
        backgroundView.addSubview(connectBtn)
        
        deviceIcon.snp.makeConstraints { (make) in
            make.left.equalTo(21)
            make.top.equalTo(27)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        
        deviceNameLabel.snp.makeConstraints {[unowned self] (make) in
            make.left
                .equalTo(self.deviceIcon.snp.right).offset(18)
            make.top.equalTo(19)
            make.height.equalTo(42)
        }
        
        batteryLabel.snp.makeConstraints {[unowned self] (make) in
            make.left
                .equalTo(self.deviceNameLabel.snp.left)
            make.top
                .equalTo(deviceNameLabel.snp.bottom).offset(3)
            make.height.equalTo(21)
        }
        
        connectStateLabel.snp.makeConstraints {[unowned self] (make) in
            make.centerY
                .equalTo(self.deviceNameLabel.snp.centerY)
            make.right.equalTo(-24)
        }
        
        macLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(-15)
            make.right.equalTo(-24)
        }
        
        connectBtn.snp.makeConstraints {[unowned self] (make) in
            make.left
                .equalTo(self.deviceNameLabel.snp.left)
            make.top
                .equalTo(self.batteryLabel.snp.bottom).offset(15)
            make.height.equalTo(35)
            make.width.equalTo(110)
        }
    }
    
    deinit {
        print("xiaohuile")
    }
    
}
