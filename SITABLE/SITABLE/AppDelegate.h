//
//  AppDelegate.h
//  SITABLE
//
//  Created by 宋军 on 2018/4/9.
//  Copyright © 2018 sita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "SitaBleManager.h"
typedef void(^InitBleSccessBlock) (NSString *sucessInfo) ;//获取蓝牙连接成功的块
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(copy, nonatomic)InitBleSccessBlock initBleSccessBlock;

@end

