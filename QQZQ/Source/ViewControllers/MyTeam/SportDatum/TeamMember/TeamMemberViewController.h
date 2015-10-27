//
//  TeamMemberViewController.h
//  QQZQ
//
//  Created by cafuc on 15/10/20.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamMemberViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//踢出
@property (weak,nonatomic) IBOutlet UIButton *buttonShotOff;
//tabview
@property (weak,nonatomic) IBOutlet UITableView *tableViewMember;

//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
