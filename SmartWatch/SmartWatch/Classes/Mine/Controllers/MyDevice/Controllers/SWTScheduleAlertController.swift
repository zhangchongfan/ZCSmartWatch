//
//  SWTScheduleAlarmController.swift
//  SmartWatch
//
//  Created by 张冲 on 7/10/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

class SWTScheduleAlertController: UIViewController {
    
    lazy var noAlertView: SWTNoAlertView = {
        let view = SWTNoAlertView(frame: CGRect.zero)
        return view
    }()
    
    lazy var tableView: UITableView = {[weak self] in
        let tv = UITableView(frame: CGRect.zero, style: .grouped)
        tv.delegate = self;
        tv.dataSource = self;
        tv.separatorStyle = .none
        tv.tableFooterView = UIView()
        tv.register(SWTScheduleAlertCell.self, forCellReuseIdentifier: "Cell")
        return tv
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "日程提醒"
        view.backgroundColor = UIColor.white
        initUI()
    }
    
    
    func initUI() {
        view.addSubview(noAlertView)
        noAlertView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(
                barButtonSystemItem: .add,
                target: self,
                action: #selector(addAction))
        
    }
    
    @objc
    func addAction() {
        let editController = SWTScheduleAlertEditController()
        navigationController?
            .pushViewController(editController,
                                animated: true)
    }

}


extension SWTScheduleAlertController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SWTScheduleAlertCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SWTScheduleAlertCell
        cell.titleLabel.text = "购物"
        cell.describLabel.text = "明天中午去购物"
        cell.timeLabel.text = "2018-09-09 10:12"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 93
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("删除")
        }
    }
    
    
}
