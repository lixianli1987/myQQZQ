//
//  MyQuanQuanWalletViewController.m
//  QQZQ
//
//  Created by cafuc on 15/12/9.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "MyQuanQuanWalletViewController.h"
#import "RechargeViewController.h"
#import "ChargeMoneyViewController.h"
#import "GetCashViewController.h"


@interface MyQuanQuanWalletViewController ()

@end


@implementation MyQuanQuanWalletViewController

@synthesize labelBalance;
@synthesize viewRecharge;
@synthesize viewCash;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //设置个人资料
    UITapGestureRecognizer *sinTapviewRecharge= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewRecharge addGestureRecognizer:sinTapviewRecharge];
    //邀请朋友
    UITapGestureRecognizer *sinTapviewCash = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewCash addGestureRecognizer:sinTapviewCash];
    
}

//单击手势
-(void)sinTapView:(UITapGestureRecognizer *)sender
{
    int viewTag =sender.view.tag;
    NSLog(@"点击了%d",viewTag);
    
    switch (viewTag) {
        case 10:
            NSLog(@"点击了充值");
            [self jumpChargeMoney];
            break;
        case 11:
            NSLog(@"点击了提现");
            [self jumpGetCash];
            break;
        default:
            break;
    }
}


//按钮执行方法
-(IBAction)clickBtn:(id)sender
{
    UIButton *tmpBtn = (UIButton *)sender;
    
    //tag = 10
    //点击了返回按钮
    switch (tmpBtn.tag) {
        case 10:
            NSLog(@"点击了返回按钮");
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 11:
            NSLog(@"点击了明细按钮");
            [self jumpToDetail];
            break;
            
        default:
            break;
    }
    
}

//跳往明细页面
-(void) jumpToDetail
{
    RechargeViewController *rechargeViewController = [[RechargeViewController alloc] init];
    [self.navigationController pushViewController:rechargeViewController animated:YES];
}

//跳往充值页面
-(void) jumpChargeMoney
{
    ChargeMoneyViewController *chargeMoneyViewController = [[ChargeMoneyViewController alloc] init];
    [self.navigationController pushViewController:chargeMoneyViewController animated:YES];
}

//跳往提取现金页面
-(void) jumpGetCash
{
    GetCashViewController *getCashViewController = [[GetCashViewController alloc] init];
    [self.navigationController pushViewController:getCashViewController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
