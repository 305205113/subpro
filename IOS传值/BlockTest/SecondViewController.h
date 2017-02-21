//
//  SecondViewController.h
//  BlockTest
//
//  Created by jumpapp1 on 2017/2/20.
//  Copyright © 2017年 jumpapp1. All rights reserved.
//

#import <UIKit/UIKit.h>

//Block
typedef void (^ablock)(NSString *str,UIColor *color);

//Delegate
@protocol SecondviewDelegate <NSObject>
-(void)showInputString:(NSString *)string;

@end

@interface SecondViewController : UIViewController

//Block
@property (nonatomic, copy) ablock block;

//Delegate
@property (nonatomic,weak)id<SecondviewDelegate> delegate;

@end
