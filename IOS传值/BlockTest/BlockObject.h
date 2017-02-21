//
//  BlockObject.h
//  BlockTest
//
//  Created by jumpapp1 on 2017/2/21.
//  Copyright © 2017年 jumpapp1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//声明
typedef void (^changeColor)(UIColor *newColor);
@interface BlockObject : NSObject

+(void)changeButtonColor:(changeColor)changeColor;
@end

