//
//  SitaBlePerObj.h
//  SJBLE
//
//  Created by 宋军 on 2018/4/4.
//  Copyright © 2018 sita. All rights reserved.
//

#import <Foundation/Foundation.h>
//外设对象
@interface SitaBlePerObj : NSObject
@property(nonatomic,strong)NSString *sitaPerId;  //中控号
@property(nonatomic,assign)NSNumber* sitaPerRssi;  //信号强度
@end
