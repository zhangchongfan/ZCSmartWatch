//
//  ZCBlePeripheralProtocol.h
//  ZCBLESDK
//
//  Created by 张冲 on 2019/2/25.
//  Copyright © 2019 张冲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
@class ZCBleCentralManager;

@protocol ZCBlePeripheralDelegate <NSObject>

@required
//配置centralManager
- (void)configBleCentralManager:(ZCBleCentralManager *)centralManager;
//接收到设备发送过来的数据
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error;

@end


