//
//  ViewController.m
//  BlockTest
//
//  Created by jumpapp1 on 2017/2/20.
//  Copyright © 2017年 jumpapp1. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "BlockObject.h"
#import "DataSource.h"

@interface ViewController () <SecondviewDelegate>
@property (nonatomic,strong)UIButton *blockBtn;
@property (nonatomic,strong)UIButton *pushBtn;
@property (nonatomic,strong)UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //KVO
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationChange:) name:@"postNotification" object:nil];
    [self createElement];
}

//changeColor
-(void)pushBtnPress:(UIButton *)sender{
    [BlockObject changeButtonColor:^(UIColor *newColor) {
        self.view.backgroundColor = newColor;
    }];
}

//block
-(void)blockBtnPress:(UIButton *)sender {
    SecondViewController *second = [[SecondViewController alloc]init];
    //代理
    second.delegate = self;
    __weak ViewController *wself = self;
    [self presentViewController:second animated:NO completion:nil];
    second.block = ^(NSString *str,UIColor *color){
        wself.view.backgroundColor = color;
        if ([str isEqualToString:@""]) {
            wself.label.text = @"SenderString";
        }else{
            wself.label.text = str;
        }
    };
}

//Delegate Action
-(void)showInputString:(NSString *)string{
    self.label.text = string;
}


//NSNotification
-(void)notificationChange:(NSNotification *)notification{
    NSDictionary *dict = [notification userInfo];
    self.label.text = dict[@"inpuntString"];
}

//NSUserDefaults && singleton
-(void)viewDidAppear:(BOOL)animated{
//NSUserDefaults
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"inputString"] length] >0) {
        self.label.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"inputString"];
        [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"inputString"];
    }

//singleton
    self.label.text = [DataSource shareInstance].string;
    
}

-(void)createElement{
    CGRect aScreenRect = [[UIScreen mainScreen] bounds];
    //创建navbar
    UINavigationBar *nav = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, aScreenRect.size.width, 44)];
    nav.backgroundColor = [UIColor blueColor];
    //创建navbaritem
    UINavigationItem *NavTitle = [[UINavigationItem alloc] initWithTitle:@"viewController"];
    [nav pushNavigationItem:NavTitle animated:YES];
    [self.view addSubview:nav];
    
    //创建barbutton 创建系统样式的
    //    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(navBackBt:)];
    //    //设置barbutton
    //    NavTitle.leftBarButtonItem = item;
    //    [nav setItems:[NSArray arrayWithObject:NavTitle]];
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(20, 210, self.view.frame.size.width -40, 35)];
    _label.font = [UIFont systemFontOfSize:35];
    _label.textColor = [UIColor blackColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"SenderString";
    [self.view addSubview:_label];
    
    
    _blockBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _blockBtn.frame = CGRectMake(20, 300, self.view.frame.size.width -40, 40);
    _blockBtn.titleLabel.font = [UIFont systemFontOfSize:30];
    [_blockBtn setTitle:@"Go To Secondview" forState:UIControlStateNormal];
    [_blockBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_blockBtn addTarget:self action:@selector(blockBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_blockBtn];
    
    _pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _pushBtn.frame = CGRectMake(20, 400, self.view.frame.size.width -40, 40);
    _pushBtn.titleLabel.font = [UIFont systemFontOfSize:30];
    [_pushBtn setTitle:@"changeColor" forState:UIControlStateNormal];
    [_pushBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_pushBtn addTarget:self action:@selector(pushBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_pushBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
