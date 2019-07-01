//
//  ZCFunctionSwitchStateModel.h
//  ZCBLESDK
//
//  Created by 张冲 on 5/4/19.
//  Copyright © 2019 张冲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZCFunctionSwitchStateModel : NSObject

//低电提醒0关 1开
@property (nonatomic, assign, readonly) int lowPowerAlert;
//抬手亮屏显示0关 1开
@property (nonatomic, assign, readonly) int raiseHandState;
//设备防丢0关 1开
@property (nonatomic, assign, readonly) int preventLossState;
//心率自动检测0关 1开
@property (nonatomic, assign, readonly) int heartAutoDetectState;
//翻腕切屏0关 1开
@property (nonatomic, assign, readonly) int wristSwitchScreenState;

//心率自动检测间隔1是15 2是30 3是45以此类推
@property (nonatomic, assign, readonly) int heartDetectDuration;

- (instancetype)initWithFunctionSwitchStateData:(NSData *)functionSwitchStateData;

@end

NS_ASSUME_NONNULL_END
