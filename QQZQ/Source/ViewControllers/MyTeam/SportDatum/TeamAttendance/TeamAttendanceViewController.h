//
//  TeamAttendanceViewController.h
//  QQZQ
//
//  Created by cafuc on 15/10/24.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamAttendanceViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//出勤管理
@property (weak,nonatomic) IBOutlet UIButton *buttonAttendanceManagement;
//出勤统计
@property (weak,nonatomic) IBOutlet UIButton *buttonAttendanceStatistics;

//scrollview
@property (strong,nonatomic) IBOutlet UIScrollView *scrollViewAll;

//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
