//
//  ZCMessageAlertModel.h
//  ZCBLESDK
//
//  Created by 张冲 on 5/4/19.
//  Copyright © 2019 张冲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZCMessageAlertModel : NSObject

//电话0关 1开
@property (nonatomic, assign, readonly) int phontAlertState;
//短信0关 1开
@property (nonatomic, assign, readonly) int smsAlertState;
//其他消息0关 1开
@property (nonatomic, assign, readonly) int messageAlertState;

- (instancetype)initWithMessageAlertData:(NSData *)messageAlertData;

@end

NS_ASSUME_NONNULL_END
