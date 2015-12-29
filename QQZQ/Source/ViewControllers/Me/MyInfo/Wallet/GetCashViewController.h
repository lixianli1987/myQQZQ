//
//  GetCashViewController.h
//  QQZQ
//
//  Created by cafuc on 15/12/16.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GetCashViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//钱包余额
@property (weak,nonatomic) IBOutlet UILabel *labelMoney;
//输入提现金额
@property (weak,nonatomic) IBOutlet UITextField *textFieldMoney;
//设置提现账户
@property (weak,nonatomic) IBOutlet UIView *viewAccount;
//规则
@property (weak,nonatomic) IBOutlet UIView *viewRule;
//提现
@property (weak,nonatomic) IBOutlet UIButton *buttonSure;


//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
