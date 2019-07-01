//
//  ZCMacModel.h
//  ZCBLESDK
//
//  Created by 张冲 on 5/3/19.
//  Copyright © 2019 张冲. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZCMacModel : NSObject

@property (nonatomic, strong, readonly) NSString *mac;

- (instancetype)initWithDeviceMacData:(NSData *)macData;

@end

NS_ASSUME_NONNULL_END
