//
//  ZCPeripheralPublicTool.h
//  ZCBLESDK
//
//  Created by 张冲 on 2019/2/26.
//  Copyright © 2019 张冲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZCPeripheralPublicTool : NSObject

+ (NSString *)zc_characteristicPropertyString:(CBCharacteristic *)characteristic;

@end

NS_ASSUME_NONNULL_END
