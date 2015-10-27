//
//  InitiateViewController.h
//  QQZQ
//
//  Created by cafuc on 15/9/5.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InitiateViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//发布按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonSure;
//uiviewScrollView
@property (weak,nonatomic) IBOutlet UIScrollView *scrollViewAll;

//view
@property (strong,nonatomic) UIView *view1;
@property (strong,nonatomic) UIView *view2;
@property (strong,nonatomic) UIView *view3;
@property (strong,nonatomic) UIView *view4;
@property (strong,nonatomic) UIView *view5;
@property (strong,nonatomic) UIView *view6;

//球队内部活动label
@property (strong,nonatomic) UILabel *labelSportName;


//dataPicker
@property (strong,nonatomic) UIDatePicker *datePicker;


//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
