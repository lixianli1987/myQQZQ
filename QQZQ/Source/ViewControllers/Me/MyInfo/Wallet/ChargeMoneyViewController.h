//
//  ChargeMoneyViewController.h
//  QQZQ
//
//  Created by cafuc on 15/12/15.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChargeMoneyViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//钱包余额
@property (weak,nonatomic) IBOutlet UILabel *labelMoney;
//输入充值金额
@property (weak,nonatomic) IBOutlet UITextField *textFieldMoney;
//支付宝方式



//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
