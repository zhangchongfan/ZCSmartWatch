//
//  SWTUnitSettingController.swift
//  SmartWatch
//
//  Created by 张冲 on 6/24/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

class SWTUnitSettingController: UIViewController {

    lazy var tableView: UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: .grouped)
        tv.delegate = self;
        tv.dataSource = self;
        tv.separatorStyle = .none
        tv.sectionHeaderHeight = 20
        tv.sectionFooterHeight = 0
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "单位"
        createUnitSettingControllerUI()
    }
    
    func createUnitSettingControllerUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    func showAlert(index: Int) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let alertAction1 = UIAlertAction(title: "公制(米、公里)", style: .default) { (action) in
            
        }
        alertAction1.setValue(
            SWTAppCommonColor.appCommonBlackColor(),
            forKey: "_titleTextColor"
        )
        let alertAction2 = UIAlertAction(title: "英制(英尺、英里)", style: .default) { (action) in
            
        }
        alertAction2.setValue(
            SWTAppCommonColor.appCommonBlackColor(),
            forKey: "_titleTextColor"
        )
        let alertAction3 = UIAlertAction(title: "取消", style: .cancel) { (action) in
            
        }
        alertAction3.setValue(
            SWTAppCommonColor.appMainColor(),
            forKey: "_titleTextColor"
        )
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        alertController.addAction(alertAction3)
        present(alertController, animated: true, completion: nil)
    }

}

extension SWTUnitSettingController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var dCell: SWTSettingTableViewCell? = tableView.dequeueReusableCell(withIdentifier: MIME_SETTING_CELL_ID) as? SWTSettingTableViewCell
        if dCell == nil {
            dCell = SWTSettingTableViewCell(style: .value1, reuseIdentifier: MIME_SETTING_CELL_ID)
        }
        
        guard let cell = dCell else {
            return dCell ?? UITableViewCell()
        }
        
        let titles = ["距离单位", "时间单位", "温度单位"]
        cell.textLabel?.text = titles[indexPath.row]
        
        let values = ["公里", "24小时", "摄氏度"]
        cell.detailTextLabel?.text = values[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SWTAppCommonConstant.appCellHeight()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showAlert(index: indexPath.row)
    }
    
}
