//
//  AppDelegate.m
//  SITABLE
//
//  Created by 宋军 on 2018/4/9.
//  Copyright © 2018 sita. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [_window makeKeyAndVisible];
    
    //初始化蓝牙模块
    SitaBleManager *bleManager = [SitaBleManager shareInstence];
    [bleManager initBleSuccess:^(NSString *initSuccess) {
        NSLog(@"%@",initSuccess);
        self.initBleSccessBlock(initSuccess);
    } failedInit:^(NSString *initFailed) {
        NSLog(@"%@",initFailed);
    }];
    
    _window.backgroundColor = [UIColor whiteColor];
    ViewController *sitaBleVc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"mainVc"];
    UINavigationController *rootNc = [[UINavigationController alloc] initWithRootViewController:sitaBleVc];
    UINavigationBar.appearance.translucent = NO;
    _window.rootViewController = rootNc;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
