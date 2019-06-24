//
//  SWTAboutUsController.swift
//  SmartWatch
//
//  Created by 张冲 on 6/24/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

class SWTAboutUsController: UIViewController {

    lazy var tableView: UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: .plain)
        tv.delegate = self;
        tv.dataSource = self;
        tv.separatorStyle = .none
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 190))
        header.backgroundColor = UIColor.color("eeeeee")
        
        tv.tableHeaderView = header
        
        let appIcon = UIImageView(image: UIImage())
        appIcon.backgroundColor = UIColor.white
        appIcon.layer.cornerRadius = 15
        appIcon.layer.masksToBounds = true
        header.addSubview(appIcon)
        
        let appName = UILabel()
        appName.textColor = SWTAppCommonColor.appCommonBlackColor()
        appName.font = UIFont.systemFont(ofSize: 17)
        appName.text = "UFit V1.0"
        header.addSubview(appName)
        
        appIcon.snp.makeConstraints({ (make) in
            make.centerX.equalTo(header)
            make.centerY.equalTo(header).offset(-10)
            make.height.width.equalTo(90)
        })
        
        appName.snp.makeConstraints({ (make) in
            make.centerX.equalTo(header)
            make.top
                .equalTo(appIcon.snp.bottom).offset(15)
            make.height.equalTo(20)
        })
        
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "关于我们"
        createAboutUsControllerUI()
    }
    
    func createAboutUsControllerUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }

}

extension SWTAboutUsController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var dCell: SWTSettingTableViewCell? = tableView.dequeueReusableCell(withIdentifier: MIME_SETTING_CELL_ID) as? SWTSettingTableViewCell
        if dCell == nil {
            dCell = SWTSettingTableViewCell(style: .value1, reuseIdentifier: MIME_SETTING_CELL_ID)
        }
        
        guard let cell = dCell else {
            return dCell ?? UITableViewCell()
        }
        
        let titles = ["UFit微信公众号", "UFit微信微博", "商务合作", "官方客服热线", "官方网址"]
        cell.textLabel?.text = titles[indexPath.row]
        
        let values = ["wx123456", "Ufit网", "branding@ufit.com", "400-8888-888", "www.ufit.com"]
        cell.detailTextLabel?.text = values[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SWTAppCommonConstant.appCellHeight()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
