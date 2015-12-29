//
//  RechargeViewController.h
//  QQZQ
//
//  Created by cafuc on 15/12/15.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RechargeViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//tabview
@property (weak,nonatomic) IBOutlet UITableView *tableViewRecharge;


//响应按钮方法
-(IBAction)clickBtn:(id)sender;


@end
