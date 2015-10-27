//
//  HomePageViewController.h
//  QQZQ
//
//  Created by cafuc on 15/8/25.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageViewController : UIViewController

//地点按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonLocation;
//公开活动
@property (weak,nonatomic) IBOutlet UIButton *buttonPublicActivity;
//找球场
@property (weak,nonatomic) IBOutlet UIButton *buttonLookForFootballCourt;
//球队排行榜
@property (weak,nonatomic) IBOutlet UIButton *buttonSportRankList;
//tableView
@property (weak,nonatomic) IBOutlet UITableView *tableViewActivity;


//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
