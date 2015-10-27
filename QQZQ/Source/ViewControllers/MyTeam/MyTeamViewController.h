//
//  MyTeamViewController.h
//  QQZQ
//
//  Created by cafuc on 15/8/25.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTeamViewController : UIViewController


//添加球队按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonAddSportTeam;
//球队管理
@property (weak,nonatomic) IBOutlet UIButton *buttonTeamManage;
//球队内部活动
@property (weak,nonatomic) IBOutlet UIButton *buttonTeamInnerActivity;


//scrollview
@property (strong,nonatomic) IBOutlet UIScrollView *scrollViewAll;

//响应按钮方法
-(IBAction)clickBtn:(id)sender;


@end
