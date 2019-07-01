//
//  ZCDisplayTimeModel.h
//  ZCBLESDK
//
//  Created by 张冲 on 5/4/19.
//  Copyright © 2019 张冲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZCDisplayTimeModel : NSObject


//年
@property (nonatomic, assign, readonly) int year;
//月
@property (nonatomic, assign, readonly) int month;
//天
@property (nonatomic, assign, readonly) int day;
//时
@property (nonatomic, assign, readonly) int hour;
//分
@property (nonatomic, assign, readonly) int minute;
//秒
@property (nonatomic, assign, readonly) int second;

- (instancetype)initWithDisplayTimeData:(NSData *)displayTimeData;

@end

NS_ASSUME_NONNULL_END
