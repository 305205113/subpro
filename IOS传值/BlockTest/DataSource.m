//
//  DataSource.m
//  BlockTest
//
//  Created by jumpapp1 on 2017/2/21.
//  Copyright © 2017年 jumpapp1. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource
//创建静态对象，防止外部访问
static DataSource *_instance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}


@end
