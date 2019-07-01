//
//  ZCAlarmModel.h
//  ZCBLESDK
//
//  Created by 张冲 on 5/3/19.
//  Copyright © 2019 张冲. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCAlarmModel : NSObject

//闹钟序号做多10组闹钟
@property (nonatomic, assign, readonly) int orderID;
//闹钟状态0是关闭，1是开启
@property (nonatomic, assign, readonly) int state;
//闹钟重复方式bite0到bite6是星期日到星期6，bite7==1，只重复一次
@property (nonatomic, assign, readonly) int repeatType;
//时
@property (nonatomic, assign, readonly) int hour;
//分
@property (nonatomic, assign, readonly) int minute;
//标签
@property (nonatomic, assign, readonly) int label;

- (instancetype)initWithAlarmData:(NSData *)alarmData;

@end

