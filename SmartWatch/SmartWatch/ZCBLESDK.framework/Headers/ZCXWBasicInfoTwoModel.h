//
//  ZCXWBasicInfoTwoModel.h
//  ZCBLESDK
//
//  Created by 张冲 on 5/3/19.
//  Copyright © 2019 张冲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZCXWBasicInfoTwoModel : NSObject

//性别0女 1男
@property (nonatomic, assign, readonly) int sex;
//年龄
@property (nonatomic, assign, readonly) int age;
//身高
@property (nonatomic, assign, readonly) int status;
//体重
@property (nonatomic, assign, readonly) int weight;
//设备系统当前语言0x00:中文 0x01:英文 0x02:德文 0x03:意大利文 0x04:繁体中文 0x05:西班牙文 0x06:葡萄牙文 0x07:日文 0x08:法文 0x09:俄罗斯文 0x0A:土耳其文
@property (nonatomic, assign, readonly) int systemLanguage;
//时间制式0是24小时制式， 1是12小时制式
@property (nonatomic, assign, readonly) int timeFormat;
//单位制式0是公制，1是英制
@property (nonatomic, assign, readonly) int unitFormat;
//适配手机系统0是iOS， 1是Android
@property (nonatomic, assign, readonly) int phoneSystem;
//0是左手， 1是右手
@property (nonatomic, assign, readonly) int handWearMode;
//温度制式0是摄氏度， 1是华氏度
@property (nonatomic, assign, readonly) int temperatureFormat;
//运动目标
@property (nonatomic, assign, readonly) int stepsGoal;

- (instancetype)initWithBasicInfoTwoData:(NSData *)basicInfoTwoData;

@end

NS_ASSUME_NONNULL_END
