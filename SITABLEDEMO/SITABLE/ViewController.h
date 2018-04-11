//
//  ViewController.h
//  SITABLE
//
//  Created by 宋军 on 2018/4/9.
//  Copyright © 2018 sita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SitaBleManager.h"
#import "Macro.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *baseTableView;
@property(nonatomic,strong)NSMutableArray *devicesArr;

@end

