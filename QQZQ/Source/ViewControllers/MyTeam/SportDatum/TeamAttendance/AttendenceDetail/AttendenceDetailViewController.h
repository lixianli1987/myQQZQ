//
//  AttendenceDetailViewController.h
//  QQZQ
//
//  Created by cafuc on 15/11/7.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttendenceDetailViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//保存按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonSave;
//比赛名称
@property (weak,nonatomic) IBOutlet UILabel *labelName;
//比赛时间
@property (weak,nonatomic) IBOutlet UILabel *labelTime;

//tabview
@property (weak,nonatomic) IBOutlet UITableView *tableViewCompete;

//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
