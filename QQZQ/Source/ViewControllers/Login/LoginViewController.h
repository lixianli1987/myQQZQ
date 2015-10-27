//
//  LoginViewController.h
//  QQZQ
//
//  Created by cafuc on 15/8/26.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController


//电话号码
@property (weak,nonatomic) IBOutlet UITextField *textFieldTelephone;
//密码
@property (weak,nonatomic) IBOutlet UITextField *textFieldPassword;
//忘记密码
@property (weak,nonatomic) IBOutlet UIButton *buttonForgot;
//登陆按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonLogin;
//登陆view
@property (weak,nonatomic) IBOutlet UIView *viewLogin;
//注册按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonregister;
//注册view
@property (weak,nonatomic) IBOutlet UIView *viewregister;



//响应按钮方法
-(IBAction)clickBtn:(id)sender;


@end
