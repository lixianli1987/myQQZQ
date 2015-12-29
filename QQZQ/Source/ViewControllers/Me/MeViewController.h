//
//  MeViewController.h
//  QQZQ
//
//  Created by cafuc on 15/8/25.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeViewController : UIViewController

//个人资料设置
@property (weak,nonatomic) IBOutlet UIButton *buttonSetPersonalData;
//个人资料设置view
@property (weak,nonatomic) IBOutlet UIView *viewSetPersonalData;
//个人头像
@property (weak,nonatomic) IBOutlet UIImageView *imageViewHeaderImg;
//昵称
@property (weak,nonatomic) IBOutlet UILabel *lableNickName;
//圈圈号
@property (weak,nonatomic) IBOutlet UILabel *labelQuanQuanNum;

//邀请朋友
@property (weak,nonatomic) IBOutlet UIView *viewInviteFriend;
//我的圈圈钱包
@property (weak,nonatomic) IBOutlet UIView *viewMyWallet;
//我的相册
@property (weak,nonatomic) IBOutlet UIView *viewMyPhoto;
//我的历史活动
@property (weak,nonatomic) IBOutlet UIView *viewMyActivity;
//消息
@property (weak,nonatomic) IBOutlet UIView *viewMessage;
//设置
@property (weak,nonatomic) IBOutlet UIView *viewMySet;

//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
