//
//  ViewController.m
//  SITABLE
//
//  Created by 宋军 on 2018/4/9.
//  Copyright © 2018 sita. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _baseTableView.dataSource = self;
    _baseTableView.delegate = self;
    
    AppDelegate *appdelegate = ShareApp;
    appdelegate.initBleSccessBlock = ^(NSString *sucessInfo) {
        [self scanBleDevices];
    };
    _devicesArr = [NSMutableArray arrayWithCapacity:1];
}

-(void)scanBleDevices
{
    SitaBleManager *bleManager = [SitaBleManager shareInstence];
    [bleManager scanPeripherals:^(NSMutableArray *peripheralsArr) {
        self->_devicesArr = peripheralsArr;
        [self->_baseTableView reloadData];
    }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _devicesArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
    }
    SitaBlePerObj *bleDevice = [_devicesArr objectAtIndex:indexPath.row];
    cell.textLabel.text = bleDevice.sitaPerId;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"信号强度:%@",bleDevice.sitaPerRssi];
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
