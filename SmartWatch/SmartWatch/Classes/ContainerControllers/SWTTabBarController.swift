//
//  SWTTabBarController.swift
//  SmartWatch
//
//  Created by 张冲 on 5/27/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

class SWTTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setChildControllers()
    }
    
    func setChildControllers() {
        self.tabBar.isTranslucent = false
        createChildViewController(
            UIViewController(), title: "健康", imageName: "main_tab_icon_datapanel", selectImageName: "main_tab_icon_datapanel_highlight")
        createChildViewController(
            UIViewController(), title: "运动", imageName: "main_tab_icon_care", selectImageName: "main_tab_icon_care_highlight")
        createChildViewController(
            SWTMineViewController(), title: "我的", imageName: "main_tab_icon_me", selectImageName: "main_tab_icon_me_highlight")
    }
    
    func createChildViewController(_ childController: UIViewController, title: String, imageName: String, selectImageName: String) {
        let nav = UINavigationController(rootViewController: childController)
        nav.title = title
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage(named: imageName)
        nav.tabBarItem.selectedImage = UIImage(named: selectImageName)?.withRenderingMode(.alwaysOriginal)
        
        let textAttrs = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        nav.tabBarItem
            .setTitleTextAttributes(textAttrs, for: .normal)
        let selectTextAttrs = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        nav.tabBarItem
            .setTitleTextAttributes(selectTextAttrs, for: .selected)
        self.addChild(nav)
    }

}
