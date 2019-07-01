//
//  ZCBleOption.h
//  ZCBLESDK
//
//  Created by 张冲 on 2019/2/21.
//  Copyright © 2019 张冲. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCBleOption : NSObject

@property (nonatomic, strong) NSDictionary *bleManagerOptions;
@property (nonatomic, strong) NSDictionary *bleConnectOptions;
@property (nonatomic, strong) NSDictionary *bleScanOptions;

//扫描时的过滤
@property (nonatomic, strong) NSArray *bleScanFilterUUIDS;

//系统连接蓝牙的过滤
@property (nonatomic, strong) NSArray *bleRetrieveConnectedFilterUUIDS;

//创建实例
+ (instancetype)sharedOption;

@end

