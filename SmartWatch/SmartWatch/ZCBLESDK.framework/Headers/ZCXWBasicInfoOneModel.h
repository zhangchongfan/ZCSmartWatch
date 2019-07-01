//
//  ZCXWBasicInfoOneModel.h
//  ZCBLESDK
//
//  Created by 张冲 on 5/3/19.
//  Copyright © 2019 张冲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZCXWBasicInfoOneModel : NSObject

//设备ID
@property (nonatomic, assign, readonly) int deviceId;
//固件版本
@property (nonatomic, assign, readonly) int firmVersion;
//电池状态1充电，2充满， 3是低电
@property (nonatomic, assign, readonly) int batteryState;
//电池电量百分比， 暂时无用
@property (nonatomic, assign, readonly) int batteryPercent;
//客户ID
@property (nonatomic, assign, readonly) int clientID;
//是否有心率功能0没有， 1有
@property (nonatomic, assign, readonly) int heartType;
//是否有血压功能0没有， 1有
@property (nonatomic, assign, readonly) int bloodType;
//是否有血氧功能0没有， 1有
@property (nonatomic, assign, readonly) int oxygenType;
//电池最大的格数
@property (nonatomic, assign, readonly) int batteryMaxLevel;
//电池当前的格数
@property (nonatomic, assign, readonly) int batteryCurrentLevel;

- (instancetype)initWithBasicInfoOneData:(NSData *)basicInfoOneData;

@end

NS_ASSUME_NONNULL_END
