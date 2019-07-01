//
//  SWTMyDeviceConnectController.swift
//  SmartWatch
//
//  Created by 张冲 on 6/26/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

class SWTMyDeviceConnectController: UIViewController {
    
    lazy var tableView: UITableView = {[weak self] in
        let tv = UITableView(frame: CGRect.zero, style: .grouped)
        tv.delegate = self;
        tv.dataSource = self;
        tv.separatorStyle = .none
        tv.sectionHeaderHeight = 0
        tv.sectionFooterHeight = 20
        tv.tableHeaderView = self?.headerView
        return tv
    }()
    
    lazy var headerView: SWTMyDeviceHeaderView = {
        let header = SWTMyDeviceHeaderView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 220))
        return header
    }()
    
    var dataSource: [[SWTMyDeviceCellModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "我的设备"
        initData()
        createUI()
    }
    
    func initData() {
        let findDevice = SWTMyDeviceCellModel(imageName: "v28查找手环", title: "查找手环", detail: "")
        let camara = SWTMyDeviceCellModel(imageName: "v28远程相机", title: "远程相机", detail: "")
        let music = SWTMyDeviceCellModel(imageName: "v28远程音乐", title: "远程音乐", detail: "已开启")
        
        let sectionOneArr = [findDevice, camara, music]
        
        let schedule = SWTMyDeviceCellModel(imageName: "v28日程提醒", title: "日程提醒", detail: "已开启")
        let health = SWTMyDeviceCellModel(imageName: "v28健康提醒", title: "健康提醒", detail: "已开启")
        let alarm = SWTMyDeviceCellModel(imageName: "v28闹钟提醒", title: "闹钟提醒", detail: "已开启")
        let call = SWTMyDeviceCellModel(imageName: "v28来电提醒", title: "来电提醒", detail: "已开启")
        let sms = SWTMyDeviceCellModel(imageName: "v28短信提醒", title: "短信提醒", detail: "已开启")
        let sectionTwoArr = [schedule, health, alarm, call, sms]
        
        let other = SWTMyDeviceCellModel(imageName: "v28第三方消息推送", title: "第三方消息推送", detail: "已开启")
        let disturb = SWTMyDeviceCellModel(imageName: "v28免打扰", title: "免打扰", detail: "已开启")
        let sectionThreeArr = [other, disturb]
        
        dataSource = [sectionOneArr, sectionTwoArr, sectionThreeArr]
    }
    
    func createUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        navigationItem.rightBarButtonItem = SWTBtnFactory.naviRightBarButtonItem("v1设置-常态", selectImageName: "v1设置-按下")
    }
}

extension SWTMyDeviceConnectController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var dCell: SWTSettingTableViewCell? = tableView.dequeueReusableCell(withIdentifier: MIME_SETTING_CELL_ID) as? SWTSettingTableViewCell
        if dCell == nil {
            dCell = SWTSettingTableViewCell(style: .value1, reuseIdentifier: MIME_SETTING_CELL_ID)
        }
        
        guard let cell = dCell else {
            return dCell ?? UITableViewCell()
        }
        let model = dataSource[indexPath.section][indexPath.row]
        cell.imageView?.image = UIImage(named: model.iconImageName)
        cell.textLabel?.text = model.title
        cell.detailTextLabel?.text = model.detailText
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 20
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0
//    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        ZCPeripheralOperation.share().zc_readDeviceMac { (data, mac) in
            print(mac)
        }
    }
}
