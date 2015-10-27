//
//  RegisterViewController.h
//  QQZQ
//
//  Created by cafuc on 15/8/26.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
@property (weak,nonatomic) IBOutlet UILabel *labelCity;
@property (weak,nonatomic) IBOutlet UIView *viewCity;
@property (weak,nonatomic) IBOutlet UITextField *textFieldTelephone;
@property (weak,nonatomic) IBOutlet UITextField *textFieldYZM;
@property (weak,nonatomic) IBOutlet UIButton *buttonYZM;
@property (weak,nonatomic) IBOutlet UITextField *textFieldPassword;
@property (weak,nonatomic) IBOutlet UITextField *textFieldPasswordTwo;
@property (weak,nonatomic) IBOutlet UIButton *buttonProtocol;
@property (weak,nonatomic) IBOutlet UIView *viewRegister;
@property (weak,nonatomic) IBOutlet UIButton *buttonRegister;

//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
