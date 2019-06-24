//
//  SWTMineCellModel.swift
//  SmartWatch
//
//  Created by 张冲 on 6/22/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

class SWTMineCellModel: NSObject {
    var iconImageName: String
    var title: String
    
    init(imageName: String, title: String) {
        iconImageName = imageName
        self.title = title
    }
    
    static func modelList() -> [SWTMineCellModel] {
        let model1 = SWTMineCellModel(imageName: "mine_device", title: "我的设备")
        let model2 = SWTMineCellModel(imageName: "mine_target", title: "目标设定")
        let model3 = SWTMineCellModel(imageName: "mine_friend", title: "我的好友")
        let model4 = SWTMineCellModel(imageName: "mine_health", title: "身体数据")
        let model5 = SWTMineCellModel(imageName: "mine_tuijian", title: "推荐好友")
        return [model1, model2, model3, model4, model5]
    }
    
}
