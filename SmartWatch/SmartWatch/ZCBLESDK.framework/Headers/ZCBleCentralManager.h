//
//  ZCBleCenterManager.h
//  ZCBLESDK
//
//  Created by 张冲 on 2019/2/20.
//  Copyright © 2019 张冲. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCPeripheralModel.h"
#import "ZCBlePeripheralProtocol.h"

typedef NS_ENUM(NSInteger, ZCBleConnectState) {
    ZCBleConnectStateDisconnect = 0, //断开连接
    ZCBleConnectStateConnected, //连接成功
    ZCBleConnectStateConnectFailure, //连接失败
    ZCBleConnectStateConnectTimeOut, //连接超时
    ZCBleConnectStateDiscoverServices, //发现服务
    ZCBleConnectStateDiscoverCharacteristics, //发现特征
    ZCBleConnectStateDiscoverDescriptors, //发现描述
};

typedef NS_ENUM(NSInteger, ZCCentralManagerState) {
    ZCCentralManagerStateUnknown = 0, //系统蓝牙未知
    ZCCentralManagerStateResetting ,
    ZCCentralManagerStateUnsupport ,
    ZCCentralManagerStateUnauthorized ,
    ZCCentralManagerStatePoweredOn , //系统蓝牙打开
    ZCCentralManagerStatePoweredOff , //系统蓝牙关闭
};

//连接状态改变的回掉
typedef void(^ZCCentralManagerStateBlock)(ZCCentralManagerState centralManagerState);

//扫描设备回掉
typedef void(^ZCBleScanBlock)(NSArray <ZCPeripheralModel *>*peripheralModel);
//读取RSSI的回掉,error为nil说明读取成功
typedef void(^ZCBleReadRSSIBlock)(NSNumber *RSSI, NSError *error);
//连接状态改变的回掉
typedef void(^ZCBleConnectStateBlock)(ZCBleConnectState connectState);
//设备发现服务
typedef void(^ZCBleDiscoverServicesBlock)(ZCPeripheralModel *peripheralModel);
//设备发现服务下的特征
typedef void(^ZCBleDiscoverCharacteristicsBlock)(CBService *service);
//设备发现特征下的描述
typedef void(^ZCBleDiscoverDescriptorsBlock)(CBCharacteristic *characteristic);
//设备名称改变
typedef void(^ZCBleNameChangeBlock)(NSString *peripheralName);

@interface ZCBleCentralManager : NSObject

//用于发送数据和对接收的数据进行操作
@property (nonatomic, strong) id<ZCBlePeripheralDelegate> blePeripheralDelegate;

//已经连接设备的模型
@property (nonatomic, strong) ZCPeripheralModel *peripheralModel;

//在非主动断开连接后,是否需要主动连接设备,默认为YES
@property (nonatomic, assign) BOOL autoConnect;

//设备是否连接
@property (nonatomic, assign) BOOL connect;

//系统蓝牙是否开启
@property (nonatomic, assign, readonly) BOOL phoneBleOpen;

//有上次连接的设备
@property (nonatomic, assign, readonly) BOOL haveLastConnect;

//系统蓝牙状态改变
@property (nonatomic, copy) ZCCentralManagerStateBlock centralManagerStateBlock;

//连接状态的回调
@property (nonatomic, copy) ZCBleConnectStateBlock bleConnectStateBlock;

//设备发现服务的回调
@property (nonatomic, copy) ZCBleDiscoverServicesBlock bleDiscoverServicesBlock;

//设备发现特征的回调
@property (nonatomic, copy) ZCBleDiscoverCharacteristicsBlock bleDiscoverCharacteristicsBlock;

//设备发现特征下的描述的回调
@property (nonatomic, copy) ZCBleDiscoverDescriptorsBlock bleDiscoverDescriptorsBlock;

//设备名称发生改变的回掉
@property (nonatomic, copy) ZCBleNameChangeBlock bleNameChangeBlock;

//创建实例
+ (instancetype)sharedBleManager;

//开始扫描设备
- (void)zc_scanPeripheral:(ZCBleScanBlock)bleScanBlock;

//停止扫描
- (void)zc_cancelScan;

//连接设备
- (void)zc_connectPeripheralModel:(ZCPeripheralModel *)model;

//断开连接
- (void)zc_cancelPeripheralModel:(ZCPeripheralModel *)model;

//读取设备的RSSI
- (void)zc_readRSSI:(ZCBleReadRSSIBlock)bleReadRSSIBlock;

@end



