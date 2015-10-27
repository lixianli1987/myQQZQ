//
//  CashConsumptionTableViewCell.m
//  QQZQ
//
//  Created by cafuc on 15/10/7.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "CashConsumptionTableViewCell.h"

@implementation CashConsumptionTableViewCell

@synthesize labelTitle;
@synthesize labelTime;
@synthesize labelMoneySum;
@synthesize labelType;
@synthesize labelPeopleNum;
@synthesize labelPeopleSingle;
@synthesize labelMode;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void) initCellData:(CashConsumption *)bean
{
    labelTitle.text = bean.title;
    labelTime.text = bean.time;
    labelMoneySum.text = bean.moneySum;
    labelType.text = bean.type;
    labelPeopleNum.text = bean.peopleNum;
    labelPeopleSingle.text = bean.peopleSingle;
    labelMode.text = bean.mode;
    labelMode.textColor = [UIColor colorWithRed:62/255.0 green:199/255.0 blue:139/255.0 alpha:1];
    
}


@end
