//
//  BlockObject.m
//  BlockTest
//
//  Created by jumpapp1 on 2017/2/21.
//  Copyright © 2017年 jumpapp1. All rights reserved.
//

#import "BlockObject.h"

@implementation BlockObject

+(void)changeButtonColor:(changeColor)changeColor{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    //block定义
    changeColor([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]);
}

@end
