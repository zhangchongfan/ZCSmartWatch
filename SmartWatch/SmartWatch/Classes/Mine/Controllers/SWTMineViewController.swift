//
//  SWTMineViewController.swift
//  SmartWatch
//
//  Created by 张冲 on 6/22/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

let MIME_CELL_ID = "mineCell"

class SWTMineViewController: SWTBaseSettingController {

    let modelList = SWTMineCellModel.modelList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createUI()
        
    }

    func createUI() {
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    
}

extension SWTMineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SWTMineCell = tableView.dequeueReusableCell(withIdentifier: MIME_CELL_ID, for: indexPath) as! SWTMineCell
        cell.model = modelList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(SWTSettingViewController(), animated: true)
    }
}
