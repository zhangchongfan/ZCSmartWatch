//
//  ZCCacheManager.swift
//  SmartWatch
//
//  Created by 张冲 on 6/22/19.
//  Copyright © 2019 张冲. All rights reserved.
//

import UIKit

class ZCCacheManager: NSObject {
    
    static let shareManager = ZCCacheManager()
    
    let fileManager = FileManager.default
    
    func fileSizeOfCache() -> Float {
        
        // 获取Caches目录路径和目录下所有文件
        guard let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first,
        let files = fileManager.subpaths(atPath: cachePath) else {
            return 0
        }
        
        //枚举出所有文件，计算文件大小
        var folderSize :Float = 0
        for file in files {
            // 路径拼接
            let path = cachePath +  ("/\(file)")
            // 计算缓存大小
            folderSize  += fileSizeAtPath(path:path)
        }
        
        return folderSize/(1024*1024)
        
    }
    
    func fileSizeAtPath(path:String) -> Float {
        
        if fileManager.fileExists(atPath: path) {
            
            let attr = try! fileManager.attributesOfItem(atPath: path)
            return Float(attr[FileAttributeKey.size] as! UInt64)
        }
        return 0
        
    }
    
    func clearCache() {
        
        guard let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first,
            let files = fileManager.subpaths(atPath: cachePath) else { return }
        
        for file in files {
            
            let path = cachePath + "(/\(file))"
            if fileManager.fileExists(atPath: path) {
                
                do {
                    try fileManager.removeItem(atPath: path)
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }
        
        
    
}
