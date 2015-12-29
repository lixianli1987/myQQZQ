//
//  AccountViewController.h
//  QQZQ
//
//  Created by cafuc on 15/12/17.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;

//支付宝账户
@property (weak,nonatomic) IBOutlet UIView *viewZFB;
//银行卡账户
@property (weak,nonatomic) IBOutlet UIView *viewYH;

//支
@property (weak,nonatomic) IBOutlet UIView *viewZ;
//银
@property (weak,nonatomic) IBOutlet UIView *viewY;

//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
