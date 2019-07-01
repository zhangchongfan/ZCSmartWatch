//
//  SWTMyDeviceCellModel.swift
//  SmartWatch
//
//  Created by 张冲 on 7/1/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

class SWTMyDeviceCellModel: NSObject {

    var iconImageName: String
    var title: String
    var detailText: String
    
    init(imageName: String, title: String, detail: String) {
        iconImageName = imageName
        self.title = title
        detailText = detail;
    }

}
