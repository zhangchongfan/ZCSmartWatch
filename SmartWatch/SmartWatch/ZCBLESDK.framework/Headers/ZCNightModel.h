//
//  ZCNightModel.h
//  ZCBLESDK
//
//  Created by 张冲 on 5/4/19.
//  Copyright © 2019 张冲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZCNightModel : NSObject

//0关 1开
@property (nonatomic, assign, readonly) int state;
//开始的时
@property (nonatomic, assign, readonly) int startHour;
//开始的分
@property (nonatomic, assign, readonly) int startMinute;
//结束的时
@property (nonatomic, assign, readonly) int endHour;
//结束的分
@property (nonatomic, assign, readonly) int endMinute;

- (instancetype)initWithNightData:(NSData *)nightData;

@end

NS_ASSUME_NONNULL_END
