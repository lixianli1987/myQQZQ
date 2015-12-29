//
//  ModifySportDatumViewController.h
//  QQZQ
//
//  Created by cafuc on 15/11/8.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModifySportDatumViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//提交按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonSure;
//球队头像
@property (weak,nonatomic) IBOutlet UIView *viewSportHeadImg;
//球队名称输入框
@property (weak,nonatomic) IBOutlet UITextField *textFieldSportName;
//球队所在地
@property (weak,nonatomic) IBOutlet UIView *viewSportLocation;
//5人制按钮
@property (weak,nonatomic) IBOutlet UIButton *button5People;
//7人制按钮
@property (weak,nonatomic) IBOutlet UIButton *button7People;
//9人制按钮
@property (weak,nonatomic) IBOutlet UIButton *button9People;
//11人制按钮
@property (weak,nonatomic) IBOutlet UIButton *button11People;
//任何人
@property (weak,nonatomic) IBOutlet UIButton *buttonAnybody;
//需验证
@property (weak,nonatomic) IBOutlet UIButton *buttonNeedVerify;
//球队介绍textView
@property (strong,nonatomic) IBOutlet UITextView *textViewProfile;
//view5 7 9 11
@property (weak,nonatomic) IBOutlet UIView *view5;
@property (weak,nonatomic) IBOutlet UIView *view7;
@property (weak,nonatomic) IBOutlet UIView *view9;
@property (weak,nonatomic) IBOutlet UIView *view11;
//view 任何人 需审核
@property (weak,nonatomic) IBOutlet UIView *viewEveryOne;
@property (weak,nonatomic) IBOutlet UIView *viewNeed;


//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
