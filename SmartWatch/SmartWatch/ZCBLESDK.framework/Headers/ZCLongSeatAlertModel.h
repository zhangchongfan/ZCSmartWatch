//
//  ZCLongSeatAlertModel.h
//  ZCBLESDK
//
//  Created by 张冲 on 5/4/19.
//  Copyright © 2019 张冲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZCLongSeatAlertModel : NSObject

//闹钟状态0是关闭，1是开启
@property (nonatomic, assign, readonly) int state;
//闹钟重复方式bite0到bite6是星期日到星期6，bite7==1，只重复一次
@property (nonatomic, assign, readonly) int repeatType;
//时
@property (nonatomic, assign, readonly) int startHour1;
//分
@property (nonatomic, assign, readonly) int startMinute1;
//时
@property (nonatomic, assign, readonly) int startHour2;
//分
@property (nonatomic, assign, readonly) int startMinute2;
//时
@property (nonatomic, assign, readonly) int startHour3;
//分
@property (nonatomic, assign, readonly) int startMinute3;
//时
@property (nonatomic, assign, readonly) int endHour1;
//分
@property (nonatomic, assign, readonly) int endMinute1;
//时
@property (nonatomic, assign, readonly) int endHour2;
//分
@property (nonatomic, assign, readonly) int endMinute2;
//时
@property (nonatomic, assign, readonly) int endHour3;
//分
@property (nonatomic, assign, readonly) int endMinute3;
//提醒间隔
@property (nonatomic, assign, readonly) int alertDuration;

- (instancetype)initWithLongSeatAlertData:(NSData *)longSeatAlertData;

@end

NS_ASSUME_NONNULL_END
