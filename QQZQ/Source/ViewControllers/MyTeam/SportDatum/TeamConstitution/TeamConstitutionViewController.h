//
//  TeamConstitutionViewController.h
//  QQZQ
//
//  Created by cafuc on 15/10/7.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamConstitutionViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//邀请按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonInvite;
//uitextview
@property (weak,nonatomic) IBOutlet UITextView *textViewZC;

//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
