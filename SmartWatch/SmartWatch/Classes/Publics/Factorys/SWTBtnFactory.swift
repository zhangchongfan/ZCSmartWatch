//
//  SWTBtnFactory.swift
//  SmartWatch
//
//  Created by 张冲 on 7/1/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

class SWTBtnFactory: NSObject {
    
    static func naviRightBarButtonItem(_ imageName: String, selectImageName: String) -> UIBarButtonItem {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: selectImageName), for: .highlighted)
        let item = UIBarButtonItem(customView: btn)
        return item
    }
    
}
