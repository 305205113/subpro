//
//  DataSource.h
//  BlockTest
//
//  Created by jumpapp1 on 2017/2/21.
//  Copyright © 2017年 jumpapp1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject
//初始化方法
+(instancetype) shareInstance ;

@property (nonatomic, strong) NSString *string;
@end
