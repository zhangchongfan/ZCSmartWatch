//
//  SWTBaseSettingController.swift
//  SmartWatch
//
//  Created by 张冲 on 6/24/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

class SWTBaseSettingController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: .plain)
        tv.separatorStyle = .none
        tv.register(SWTMineCell.self, forCellReuseIdentifier: MIME_CELL_ID)
        
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatBaseSettingControllerUI();
    }

    func creatBaseSettingControllerUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
}
