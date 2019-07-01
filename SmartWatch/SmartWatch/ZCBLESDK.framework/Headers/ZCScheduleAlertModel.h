//
//  ZCScheduleAlertModel.h
//  ZCBLESDK
//
//  Created by 张冲 on 5/4/19.
//  Copyright © 2019 张冲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZCScheduleAlertModel : NSObject

//闹钟序号做多10组闹钟
@property (nonatomic, assign, readonly) int orderID;
//闹钟状态0是关闭，1是开启
@property (nonatomic, assign, readonly) int state;
//年，实际显示时加上2000
@property (nonatomic, assign, readonly) int year;
//月
@property (nonatomic, assign, readonly) int month;
//天
@property (nonatomic, assign, readonly) int day;
//时
@property (nonatomic, assign, readonly) int hour;
//分
@property (nonatomic, assign, readonly) int minute;
//标签
@property (nonatomic, assign, readonly) int label;

- (instancetype)initWithScheduleAlertData:(NSData *)scheduleAlertData;

@end

NS_ASSUME_NONNULL_END
