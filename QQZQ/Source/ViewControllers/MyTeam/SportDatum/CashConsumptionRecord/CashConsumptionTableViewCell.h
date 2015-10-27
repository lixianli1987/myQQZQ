//
//  CashConsumptionTableViewCell.h
//  QQZQ
//
//  Created by cafuc on 15/10/7.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CashConsumption.h"

@interface CashConsumptionTableViewCell : UITableViewCell

//记录标题
@property (weak,nonatomic) IBOutlet UILabel *labelTitle;
//消费日期
@property (weak,nonatomic) IBOutlet UILabel *labelTime;
//消费总计
@property (weak,nonatomic) IBOutlet UILabel *labelMoneySum;
//场地类型
@property (weak,nonatomic) IBOutlet UILabel *labelType;
//报名人数
@property (weak,nonatomic) IBOutlet UILabel *labelPeopleNum;
//人均
@property (weak,nonatomic) IBOutlet UILabel *labelPeopleSingle;
//模式
@property (weak,nonatomic) IBOutlet UILabel *labelMode;


-(void) initCellData:(CashConsumption *)bean;

@end
