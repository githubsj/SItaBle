//
//  SitaBleManager.h
//  SJBLE
//
//  Created by 宋军 on 2018/4/3.
//  Copyright © 2018 sita. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "SitaBlePerObj.h"
//--------------块定义区--------------
//1:初始化蓝牙成功------定义为:蓝牙的state状态未powerOn即为初始化成功,任何其他状态即为失败
typedef void(^InitBleSuccessBlock)(NSString *initSuccess);

//1f:初始化蓝牙失败
typedef void(^InitBleFailedBlock)(NSString *initFailed);

//2:扫描获取蓝牙列表
typedef void (^ScanPeripheralsBlock)(NSMutableArray *peripheralsArr);

//3:蓝牙连接成功的块,返回一个蓝牙外设
typedef void (^ConnectWithControlIdBlock)(NSString *controlId);

//3f:蓝牙连接失败,返回失败的中控号
typedef void (^FailedConnetedBleBlock)(NSString *controlId);

//4:断开蓝牙


//4f:断开蓝牙失败


//5:一键启动

//5f:一键启动失败


//6:一键关闭

//6f:一键关闭失败


//7:寻车

//7f:寻车失败


//8:设防

//8f:设防失败


//9:撤防

//9f:撤防失败

@interface SitaBleManager : NSObject<CBCentralManagerDelegate,CBPeripheralDelegate>
{
    InitBleSuccessBlock initBleSuccessBloc; //初始化成功的块
    InitBleFailedBlock initBleFailedBloc; //初始化蓝牙失败
    ScanPeripheralsBlock scanPeripheralsBlock; //扫描获取蓝牙列表
    ConnectWithControlIdBlock connectWithControlIdBlock;//成功连接一个外设
    FailedConnetedBleBlock failedConnetedBleBlock; //连接特定外设失败
}

@property(nonatomic,assign)BOOL bleIsConnected; //蓝牙是否处于连接状态
@property(nonatomic,assign)CBCentralManagerState bleState;//蓝牙模块状态
+(instancetype)shareInstence; //单利方法
-(void)initBleSuccess:(InitBleSuccessBlock)success failedInit:(InitBleFailedBlock)failed; //初始化系统蓝牙,状态发生变化会从这里回调
-(void)scanPeripherals:(ScanPeripheralsBlock)scanPeripherals; //获取蓝牙列表,并且按蓝牙强弱顺序排序,信号强的在上面
-(void)connectPeripheralWithControlId:(NSString *)controlId successConnetBlock:(ConnectWithControlIdBlock)successConnect failedConnet:(FailedConnetedBleBlock)failedConnect;  //按照思塔中控号连接指定设备
@end
