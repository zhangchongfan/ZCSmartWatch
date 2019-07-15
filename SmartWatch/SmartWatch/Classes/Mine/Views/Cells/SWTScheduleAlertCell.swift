//
//  SWTScheduleAlertCell.swift
//  SmartWatch
//
//  Created by 张冲 on 7/10/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

class SWTScheduleAlertCell: UITableViewCell {

    lazy var titleLabel: UILabel = {
        let lb = UILabel(frame: CGRect.zero)
        lb.font = UIFont(name: "PingFang SC", size: 24)
        lb.textColor = UIColor.color("111111")
        return lb
    }()
    
    lazy var describLabel: UILabel = {
        let lb = UILabel(frame: CGRect.zero)
        lb.font = UIFont(name: "PingFang SC", size: 15)
        lb.textColor = UIColor.color("111111")
        return lb
    }()
    
    lazy var timeLabel: UILabel = {
        let lb = UILabel(frame: CGRect.zero)
        lb.font = UIFont(name: "PingFang SC", size: 12)
        lb.textColor = UIColor.color("888888")
        return lb
    }()
    
    lazy var alertSwitch: UISwitch = {
        let sw = UISwitch()
        return sw
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }

    func initUI() {
        accessoryView = alertSwitch
        
        addSubview(titleLabel)
        addSubview(describLabel)
        addSubview(timeLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(7)
            make.left.equalTo(15)
        }
        describLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(titleLabel.snp.left)
            make.bottom.equalTo(timeLabel.snp.top)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.bottom.equalTo(-10)
        }
        
    }

}
