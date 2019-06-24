//
//  SWTMineCell.swift
//  SmartWatch
//
//  Created by 张冲 on 6/22/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit
import SnapKit

class SWTMineCell: UITableViewCell {

    lazy var iconImageView: UIImageView = {
        let imv = UIImageView(frame: CGRect.zero)
        return imv
    }()
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel(frame: CGRect.zero)
        lb.textColor = UIColor.black
        lb.font = UIFont.systemFont(ofSize: 15)
        return lb
    }()
    
    lazy var arrowImageView: UIImageView = {
        let imv = UIImageView(frame: CGRect.zero)
        imv.image = UIImage(named: "tableview_arrow")
        return imv
    }()
    
    var model: SWTMineCellModel? {
        willSet {
            titleLabel.text = newValue?.title
            iconImageView.image = UIImage(named: newValue?.iconImageName ?? "")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createMineCellUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createMineCellUI() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(arrowImageView)
        iconImageView.snp.makeConstraints {[unowned self] (make) in
            make.width.height.equalTo(20)
            make.centerY.equalTo(self)
            make.left.equalTo(16)
        }
        titleLabel.snp.makeConstraints {[unowned self] (make) in
            make.centerY.equalTo(self)
            make.left
                .equalTo(iconImageView.snp.right).offset(15)
        }
        arrowImageView.snp.makeConstraints {[unowned self] (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(-16)
        }
    }
    
}
