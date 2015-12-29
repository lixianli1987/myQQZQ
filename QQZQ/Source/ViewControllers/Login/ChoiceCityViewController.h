//
//  ChoiceCityViewController.h
//  QQZQ
//
//  Created by cafuc on 15/9/3.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoiceCityViewController : UIViewController


//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;

//tableView
@property (weak,nonatomic) IBOutlet UITableView *tableViewCity;

//城市数组
@property (strong,nonatomic) NSMutableArray *arrayCity;

//flag标记
//按照字母排序
//A安微 B北京 C重庆 D E F福建 G广东、广西、贵州、甘肃 H黑龙江、河北、河南、湖南、湖北、海南 I J吉林、江西、江苏 K L辽宁 M N宁夏、内蒙 O P Q青海 R S上海、山东、山西、陕西、四川 T天津、台湾 U V W X西藏、新疆 Y云南 Z浙江
@property (strong,nonatomic) NSString *receivedProvince;

//接收到的标志位 1:注册 2:创建球队
@property int receiveRegisterFlag;

//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
