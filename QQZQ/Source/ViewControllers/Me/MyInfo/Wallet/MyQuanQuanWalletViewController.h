//
//  MyQuanQuanWalletViewController.h
//  QQZQ
//
//  Created by cafuc on 15/12/9.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyQuanQuanWalletViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//明细按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonDetail;
//余额
@property (weak,nonatomic) IBOutlet UILabel *labelBalance;
//充值
@property (weak,nonatomic) IBOutlet UIView *viewRecharge;
//提现
@property (weak,nonatomic) IBOutlet UIView *viewCash;


//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
