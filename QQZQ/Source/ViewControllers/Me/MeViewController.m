//
//  MeViewController.m
//  QQZQ
//
//  Created by cafuc on 15/8/25.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "MeViewController.h"
#import "PersonalCardViewController.h"
#import "MyQuanQuanWalletViewController.h"
#import "MyHistoryActivityViewController.h"
#import "SetViewController.h"


@interface MeViewController ()

@end

@implementation MeViewController

@synthesize viewSetPersonalData;
@synthesize imageViewHeaderImg;
@synthesize lableNickName;
@synthesize labelQuanQuanNum;
@synthesize viewInviteFriend;
@synthesize viewMyWallet;
@synthesize viewMyPhoto;
@synthesize viewMyActivity;
@synthesize viewMessage;
@synthesize viewMySet;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //设置个人资料
    UITapGestureRecognizer *sinTapviewSetPersonalData= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewSetPersonalData addGestureRecognizer:sinTapviewSetPersonalData];
    //邀请朋友
    UITapGestureRecognizer *sinTapviewInviteFriend= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewInviteFriend addGestureRecognizer:sinTapviewInviteFriend];
    //我的圈圈钱包
    UITapGestureRecognizer *sinTapviewMyWallet= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewMyWallet addGestureRecognizer:sinTapviewMyWallet];
    //我的相册
    UITapGestureRecognizer *sinTapviewMyPhoto= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewMyPhoto addGestureRecognizer:sinTapviewMyPhoto];
    //我的历史活动
    UITapGestureRecognizer *sinTapviewMyActivity= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewMyActivity addGestureRecognizer:sinTapviewMyActivity];
    //消息
    UITapGestureRecognizer *sinTapviewMessage= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewMessage addGestureRecognizer:sinTapviewMessage];
    //设置
    UITapGestureRecognizer *sinTapviewMySet= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sinTapView:)];
    [viewMySet addGestureRecognizer:sinTapviewMySet];
    
}

//单击手势
-(void)sinTapView:(UITapGestureRecognizer *)sender
{
    int viewTag =sender.view.tag;
    NSLog(@"点击了%d",viewTag);
    switch (viewTag) {
        case 10:
            NSLog(@"点击了设置个人资料");
            break;
        case 11:
            NSLog(@"点击了邀请朋友");
            break;
        case 12:
            NSLog(@"点击了我的圈圈钱包");
            [self jumpToviewMyWallet];
            break;
        case 13:
            NSLog(@"点击了我的相册");
            break;
        case 14:
            NSLog(@"点击了我的历史活动");
            [self jumpToviewMyActivity];
            break;
        case 15:
            NSLog(@"点击了消息");
            break;
        case 16:
            NSLog(@"点击了设置");
            [self jumpToviewMySet];
            break;
        default:
            break;
    }
    
}

//跳往设置个人资料页面
-(void) jumpToviewSetPersonalData
{
    NSLog(@"个人资料页面");
}
//跳往设置个人资料页面
-(void) jumpToviewInviteFriend
{
    NSLog(@"邀请朋友页面");
}
//跳往设置个人资料页面
-(void) jumpToviewMyWallet
{
    NSLog(@"我的圈圈钱包页面");
    MyQuanQuanWalletViewController *myQuanQuanWalletViewController = [[MyQuanQuanWalletViewController alloc] init];
    [self.navigationController pushViewController:myQuanQuanWalletViewController animated:YES];
}
//跳往设置个人资料页面
-(void) jumpToviewMyPhoto
{
    NSLog(@"我的相册页面");
}
//跳往我的历史活动
-(void) jumpToviewMyActivity
{
    NSLog(@"我的历史活动页面");
    MyHistoryActivityViewController *myHistoryActivityViewController = [[MyHistoryActivityViewController alloc] init];
    [self.navigationController pushViewController:myHistoryActivityViewController animated:YES];
}
//跳往设置个人资料页面
-(void) jumpToviewMessage
{
    NSLog(@"消息页面");
}
//跳往设置个人资料页面
-(void) jumpToviewMySet
{
    NSLog(@"设置页面");
    SetViewController *setViewController = [[SetViewController alloc] init];
    [self.navigationController pushViewController:setViewController animated:YES];
}


//按钮执行方法
-(IBAction)clickBtn:(id)sender
{
    
    PersonalCardViewController *personalCardViewController = [[PersonalCardViewController alloc] init];
    [self.navigationController pushViewController:personalCardViewController animated:YES];
    
    //返回上一级页面
    //[self.navigationController popViewControllerAnimated:YES];
    
}

@end
