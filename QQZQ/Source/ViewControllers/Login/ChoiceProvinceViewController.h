//
//  ChoiceProvinceViewController.h
//  QQZQ
//
//  Created by cafuc on 15/9/3.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoiceProvinceViewController : UIViewController


//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;

//tableView
@property (weak,nonatomic) IBOutlet UITableView *tableviewProvince;

//省份数组
@property (strong,nonatomic) NSMutableArray *arrayProvince;

//接收到的标志位 1:注册 2:创建球队
@property int receiveFlag;

//响应按钮方法
-(IBAction)clickBtn:(id)sender;


@end
