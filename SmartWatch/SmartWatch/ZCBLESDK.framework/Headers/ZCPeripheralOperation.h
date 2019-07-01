//
//  ZCPeripheralOperation.h
//  ZCBLESDK
//
//  Created by 张冲 on 2019/2/25.
//  Copyright © 2019 张冲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCBlePeripheralProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@class ZCXWBasicInfoOneModel;
@class ZCXWBasicInfoTwoModel;
@class ZCAlarmModel;
@class ZCDrinkWaterAlertModel;
@class ZCScheduleAlertModel;
@class ZCLongSeatAlertModel;
@class ZCDisplayTimeModel;
@class ZCMessageAlertModel;
@class ZCNightModel;
@class ZCFunctionSwitchStateModel;


@interface ZCPeripheralOperation : NSObject <ZCBlePeripheralDelegate>

+ (instancetype)shareOperation;

#pragma mark: 系统命令
//重启设备
- (void)zc_rebootDevice:(void(^)(NSData *resultData, BOOL success))result;
//初始化设备
- (void)zc_initDevice:(void(^)(NSData *resultData, BOOL success))result;
//进入升级模式
- (void)zc_dfuDevice:(void(^)(NSData *resultData, BOOL success))result;
//关闭机器
- (void)zc_turnOffDevice:(void(^)(NSData *resultData, BOOL success))result;
//测试屏幕显示固定的文字,type 0关 1开
- (void)zc_screenDisplay:(int)type result:(void(^)(NSData *resultData, BOOL success))result;

#pragma mark: 获取设备指令
//获取设备的mac地址
- (void)zc_readDeviceMac:(void(^)(NSData *resultData, NSString *mac))result;

//获取设备的基本信息1, 这里协议要改
- (void)zc_readDeviceBasicInfoOne:(void(^)(NSData *resultData, ZCXWBasicInfoOneModel *xwBasicInfoOneModel))result;

//获取设备的基本信息2, 这里协议要改
- (void)zc_readDeviceBasicInfoTwo:(void(^)(NSData *resultData, ZCXWBasicInfoTwoModel *xwBasicInfoTwoModel))result;

//读取设备的闹钟，一共10组，设置和未设置的都会全部读取，调试设备最多支持5组闹钟
- (void)zc_readDeviceAlarms:(void(^)(NSArray <ZCAlarmModel *>*alarmModels))resulut;

//读取日程提醒最多支持5组闹钟
- (void)zc_readDeviceScheduleAlerts:(void(^)(NSArray <ZCScheduleAlertModel *>*scheduleAlertModels))resulut;

//获取喝水提醒
-  (void)zc_readDrinkWaterAlert:(void(^)(NSData *reslutData, ZCDrinkWaterAlertModel *drinkWaterAlertModel))resulut;

//获取久坐提醒闹钟
-  (void)zc_readLongSeatAlert:(void(^)(NSData *resultData, ZCLongSeatAlertModel *longSeatAlertModel))resulut;

//获取设备显示时间
-  (void)zc_readDeviceDisplayTime:(void(^)(NSData *resultData, ZCDisplayTimeModel *displayTimeModel))resulut;

//获取信息提醒开关的状态
-  (void)zc_readDeviceMessageAlertState:(void(^)(NSData *resultData, ZCMessageAlertModel *messageAlertModel))resulut;

//设备功能的开关
-  (void)zc_readDeviceFuctionSwitchStateData:(void(^)(NSData *resultData, ZCFunctionSwitchStateModel *functionSwitchStateModel))resulut;

//获取信息提醒开关的状态,发送0b的时候返回0a的信息
-  (void)zc_readDeviceNightState:(void(^)(NSData *resultData, ZCNightModel *nightModel))resulut;


//主题设置type = 0是读取， 其他是设置
//- (void)zc_settingThemeWithTpye:(short)type result:(void(^)(NSData *resultData, BOOL success))result;


@end

NS_ASSUME_NONNULL_END
