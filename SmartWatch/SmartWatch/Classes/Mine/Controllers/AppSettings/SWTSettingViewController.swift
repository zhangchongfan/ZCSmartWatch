//
//  SWTSettingViewController.swift
//  SmartWatch
//
//  Created by 张冲 on 6/22/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

let MIME_SETTING_CELL_ID = "mineSettingCell"

class SWTSettingViewController: UIViewController {

    let cellTitles = [["单位"], ["推送消息", "检查更新"], ["清除缓存", "意见反馈", "关于UFit"]]
    
    lazy var controllers: [[UIViewController]] = {
        
        return [[SWTUnitSettingController()], [SWTUnitSettingController(), SWTUnitSettingController()], [SWTUnitSettingController(), SWTUnitSettingController(), SWTAboutUsController()]]
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: .grouped)
        tv.delegate = self;
        tv.dataSource = self;
        tv.separatorStyle = .none
        tv.sectionHeaderHeight = 20
        tv.sectionFooterHeight = 0
        
        let footViewBtn = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))
        footViewBtn.backgroundColor = UIColor.white
        footViewBtn.setTitle("退出", for: .normal)
        footViewBtn
            .setTitleColor(UIColor.color("12C15C"), for: .normal)
        tv.tableFooterView = footViewBtn
        
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "设置"
        createUI()
        
    }
    
    func createUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }

}

extension SWTSettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var dCell: SWTSettingTableViewCell? = tableView.dequeueReusableCell(withIdentifier: MIME_SETTING_CELL_ID) as? SWTSettingTableViewCell
        if dCell == nil {
            dCell = SWTSettingTableViewCell(style: .value1, reuseIdentifier: MIME_SETTING_CELL_ID)
        }
        
        guard let cell = dCell else {
            return dCell ?? UITableViewCell()
        }
        
        cell.textLabel?.text = cellTitles[indexPath.section][indexPath.row]
        cell.detailTextLabel?.text = ""
        cell.accessoryView = UIImageView(image: UIImage(named: "tableview_arrow"))
        if indexPath.section == 0 {
            
        }else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let accessorySwitch = UISwitch()
                cell.accessoryView = accessorySwitch
            }else if indexPath.section == 1 {
                
            }
        }else if indexPath.section == 2 {
            if indexPath.row == 0 {
                let memorySize = ZCCacheManager.shareManager.fileSizeOfCache()
                print(String(format: "%.2fM", memorySize))
                cell.detailTextLabel?.text = String(format: "%.2fM", memorySize)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == cellTitles.count - 1 {
            return 40
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?
            .pushViewController(controllers[indexPath.section][indexPath.row], animated: true)
    }
}
