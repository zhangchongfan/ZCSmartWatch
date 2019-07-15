//
//  ZCAlertController+Extension.swift
//  SmartWatch
//
//  Created by 张冲 on 7/8/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

extension UIAlertController {
    @discardableResult
    static func showAlert(_ title: String?, message: String?, actions: [String]?, cancel: String?, color: UIColor?, click: @escaping (_ index: Int) -> ()) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancel, style: .cancel) { (action) in
            click(0)
        }
        cancelAction.setValue(UIColor(red: 17.0/255, green: 17.0/255, blue: 17.0/255, alpha: 1), forKey: "_titleTextColor")
        alertController.addAction(cancelAction)
        let otherActions = actions ?? []
        for i in 0..<otherActions.count {
            let otherTitle = otherActions[i]
            let otherAction = UIAlertAction(title: otherTitle, style: .default) { (action) in
                click(i + 1)
            }
            if color != nil {
                otherAction.setValue(color, forKey: "_titleTextColor")
            }
            alertController.addAction(otherAction)
        }
        
        return alertController
    }
}
