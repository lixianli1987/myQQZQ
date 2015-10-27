//
//  CashConsumptionRecordDetailViewController.h
//  QQZQ
//
//  Created by cafuc on 15/10/17.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CashConsumptionRecordDetailViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//活动名称
@property (weak,nonatomic) IBOutlet UILabel *labelActivityName;
//活动日期
@property (weak,nonatomic) IBOutlet UILabel *labelActivityDate;
//活动时间
@property (weak,nonatomic) IBOutlet UILabel *labelActivityTime;
//场地类型
@property (weak,nonatomic) IBOutlet UILabel *labelType;
//消费合计
@property (weak,nonatomic) IBOutlet UILabel *labelMoneySum;
//人均
@property (weak,nonatomic) IBOutlet UILabel *labelPeopleAvg;
//费用分摊模式
@property (weak,nonatomic) IBOutlet UILabel *labelMode;
//活动发起人
@property (weak,nonatomic) IBOutlet UILabel *labelInitiPeople;
//报名名单
@property (weak,nonatomic) IBOutlet UILabel *labelList;
//collection
@property (weak,nonatomic) IBOutlet UICollectionView *collectionViewList;

//响应按钮方法
-(IBAction)clickBtn:(id)sender;


@end
