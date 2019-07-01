//
//  SWTSearchDeviceController.swift
//  SmartWatch
//
//  Created by 张冲 on 6/24/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

class SWTSearchDeviceController: UIViewController {

    lazy var tableView: UITableView = {[weak self] in
        let tv = UITableView(frame: CGRect.zero, style: .plain)
        tv.delegate = self;
        tv.dataSource = self;
        tv.separatorStyle = .none
        return tv
        }()
    
    var dataSource: [ZCPeripheralModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createSearchDeviceControllerUI()
        // Do any additional setup after loading the view.
        ZCBleCentralManager
            .sharedBle()?.zc_scanPeripheral({[weak self] (model) in
                self?.dataSource = model ?? []
                self?.tableView.reloadData()
        })
        
    }
    
    func createSearchDeviceControllerUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }

}

extension SWTSearchDeviceController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var dCell: SWTSettingTableViewCell? = tableView.dequeueReusableCell(withIdentifier: MIME_SETTING_CELL_ID) as? SWTSettingTableViewCell
        if dCell == nil {
            dCell = SWTSettingTableViewCell(style: .value1, reuseIdentifier: MIME_SETTING_CELL_ID)
        }
        
        guard let cell = dCell else {
            return dCell ?? UITableViewCell()
        }
        
        let model = dataSource[indexPath.row]
        
        cell.textLabel?.text = model.mac
        
        cell.detailTextLabel?.text = String(format: "%@", model.rssi)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataSource[indexPath.row]
        ZCBleCentralManager
            .sharedBle()?.zc_connectPeripheralModel(model)
        
    }
    
}
