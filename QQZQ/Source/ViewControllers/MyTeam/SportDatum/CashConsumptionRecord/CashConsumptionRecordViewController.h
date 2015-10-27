//
//  CashConsumptionRecordViewController.h
//  QQZQ
//
//  Created by cafuc on 15/10/7.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CashConsumptionRecordViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//球队名称
@property (weak,nonatomic) IBOutlet UILabel *labelSportName;
//tableView
@property (weak,nonatomic) IBOutlet UITableView *tableViewRecord;


//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
