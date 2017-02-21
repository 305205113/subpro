//
//  SecondViewController.m
//  BlockTest
//
//  Created by jumpapp1 on 2017/2/20.
//  Copyright © 2017年 jumpapp1. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"
#import "DataSource.h"
@interface SecondViewController ()
@property (nonatomic,strong)UIButton *blockBtn;
@property (nonatomic,strong)UIButton *cancelBtn;
@property (nonatomic,strong)UIButton *delegateBtn;
@property (nonatomic,strong)UIButton *notificationBtn;
@property (nonatomic,strong)UIButton *userDefaultBtn;
@property (nonatomic,strong)UIButton *onceTokenBtn;

@property (nonatomic,strong)UITextField *textField;
@property (nonatomic,strong)UITextField *colorField;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createElement];
}


-(void)cancelBtnPress:(UIButton *)sender{
    _textField.text =@"";
}

//Block
-(void)blockBtnPress:(UIButton *)sender{
    if ([self checkTextField]) {
        UIColor *color = [UIColor lightGrayColor];
        self.block(self.textField.text,color);
    }
}

//Delegate
-(void)delegateBtnPress:(UIButton *)sender{
    if ([self checkTextField]) {
        [self.delegate showInputString:_textField.text];
    }
}

//Notification
-(void)notificationBtnPress:(UIButton *)sender{
    if ([self checkTextField]) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"postNotification" object:self userInfo:@{@"inpuntString":self.textField.text}];
    }

}

//NSUserDefaults
-(void)userDefaultBtnPress:(UIButton *)sender{
    if ([self checkTextField]) {
        [[NSUserDefaults standardUserDefaults]setObject:_textField.text forKey:@"inputString"];
    }
}

//navigationBar action
-(void)navBackBt:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//singleton
-(void)onceTokenBtnPress:(UIButton *)sender{
    if ([self checkTextField]) {
        [DataSource shareInstance].string = _textField.text;
    }
}

//textFieldCheck
-(BOOL)checkTextField{
    if ([_textField.text isEqualToString:@""]) {
        UIAlertView *alertview = [[UIAlertView alloc]initWithTitle:@"请输入要传递的参数" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertview show];
        return false;
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
        return true;
    }
}


-(void)createElement{
    CGRect aScreenRect = [[UIScreen mainScreen] bounds];
    //创建navbar
    UINavigationBar *nav = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, aScreenRect.size.width, 44)];
    //创建navbaritem
    nav.backgroundColor = [UIColor greenColor];
    UINavigationItem *NavTitle = [[UINavigationItem alloc] initWithTitle:@"SecondviewController"];
    [nav pushNavigationItem:NavTitle animated:YES];
    [self.view addSubview:nav];
    
    //创建barbutton 创建系统样式的
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRedo target:self action:@selector(navBackBt:)];
    //设置barbutton
    NavTitle.leftBarButtonItem = item;
    [nav setItems:[NSArray arrayWithObject:NavTitle]];
    
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 100, self.view.frame.size.width -40, 40)];
    _textField.layer.borderWidth = 1;
    _textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _textField.layer.cornerRadius = 5;
    _textField.placeholder = @"传递参数";
    [self.view addSubview:_textField];
    
    
    
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelBtn.frame = CGRectMake(20, 200, 100, 35);
    _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:30];
    [_cancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
    [_cancelBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_cancelBtn addTarget:self action:@selector(cancelBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_cancelBtn];
    
    _blockBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _blockBtn.frame = CGRectMake(150, 200, self.view.frame.size.width - 180, 35);
    _blockBtn.titleLabel.font = [UIFont systemFontOfSize:25];
    [_blockBtn setTitle:@"BlockSender" forState:UIControlStateNormal];
    [_blockBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_blockBtn addTarget:self action:@selector(blockBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_blockBtn];
    
    _delegateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _delegateBtn.frame = CGRectMake(150, 250, self.view.frame.size.width - 180, 35);
    _delegateBtn.titleLabel.font = [UIFont systemFontOfSize:25];
    [_delegateBtn setTitle:@"DeleteSender" forState:UIControlStateNormal];
    [_delegateBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_delegateBtn addTarget:self action:@selector(delegateBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_delegateBtn];
    
    _notificationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _notificationBtn.frame = CGRectMake(150, 300, self.view.frame.size.width - 180, 35);
    _notificationBtn.titleLabel.font = [UIFont systemFontOfSize:25];
    [_notificationBtn setTitle:@"NotificationSender" forState:UIControlStateNormal];
    [_notificationBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_notificationBtn addTarget:self action:@selector(notificationBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_notificationBtn];
    
    _userDefaultBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _userDefaultBtn.frame = CGRectMake(150, 350, self.view.frame.size.width - 180, 35);
    _userDefaultBtn.titleLabel.font = [UIFont systemFontOfSize:25];
    [_userDefaultBtn setTitle:@"UserDefaultSender" forState:UIControlStateNormal];
    [_userDefaultBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_userDefaultBtn addTarget:self action:@selector(userDefaultBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_userDefaultBtn];
    
    _onceTokenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _onceTokenBtn.frame = CGRectMake(150, 400, self.view.frame.size.width - 180, 35);
    _onceTokenBtn.titleLabel.font = [UIFont systemFontOfSize:25];
    [_onceTokenBtn setTitle:@"OnceToken" forState:UIControlStateNormal];
    [_onceTokenBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_onceTokenBtn addTarget:self action:@selector(onceTokenBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_onceTokenBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
