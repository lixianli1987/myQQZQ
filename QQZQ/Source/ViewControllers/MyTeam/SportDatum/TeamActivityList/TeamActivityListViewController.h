//
//  TeamActivityListViewController.h
//  QQZQ
//
//  Created by cafuc on 15/10/23.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamActivityListViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//球队名称
@property (weak,nonatomic) IBOutlet UILabel *labelTeamName;
//tabview
@property (weak,nonatomic) IBOutlet UITableView *tableViewTeam;

//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
