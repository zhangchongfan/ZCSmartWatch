//
//  SWTMusicControlController.swift
//  SmartWatch
//
//  Created by 张冲 on 7/8/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

class SWTMusicControlController: UIViewController {

    lazy var tableView: UITableView = {[weak self] in
        let tv = UITableView(frame: CGRect.zero, style: .grouped)
        tv.delegate = self;
        tv.dataSource = self;
        tv.separatorStyle = .none
        tv.sectionHeaderHeight = 0.1
        tv.sectionFooterHeight = 30
        return tv
        }()
    
    lazy var musicSwitch: UISwitch = {[weak self] in
        let s = UISwitch()
        s.addTarget(self, action: #selector(musicSwitchAction(sender:)), for: .valueChanged)
        return s
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "远程音乐"
        createUI()
    }
    
    func createUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    @objc
    func musicSwitchAction(sender: UISwitch) {
        print(sender.isOn ? "open" : "close")
    }

}


extension SWTMusicControlController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.selectionStyle = .none
        cell.textLabel?.text = "音乐控制"
        cell.accessoryView = musicSwitch
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 0.1))
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "开启后可在手环上控制手机音乐播放"
    }
    
}
