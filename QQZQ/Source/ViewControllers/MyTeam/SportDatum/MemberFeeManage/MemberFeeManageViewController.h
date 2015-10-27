//
//  MemberFeeManageViewController.h
//  QQZQ
//
//  Created by cafuc on 15/10/18.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberFeeManageViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//队员余额表
@property (weak,nonatomic) IBOutlet UIButton *buttonMoney;
//会员费收支明细
@property (weak,nonatomic) IBOutlet UIButton *buttonDetail;
//球队名称
@property (weak,nonatomic) IBOutlet UILabel *labelSportName;
//球队余额
@property (weak,nonatomic) IBOutlet UILabel *labelMoney;
//截止时间
@property (weak,nonatomic) IBOutlet UILabel *labelTime;
//uiscrollview
@property (weak,nonatomic) IBOutlet UIScrollView *scrollViewFeeDetail;

//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
