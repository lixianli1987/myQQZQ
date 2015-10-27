//
//  MemberFeeManageTableViewCell.m
//  QQZQ
//
//  Created by cafuc on 15/10/18.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "MemberFeeManageTableViewCell.h"

@implementation MemberFeeManageTableViewCell

@synthesize labelName;
@synthesize labelDate;
@synthesize labelIncome;
@synthesize labelExpense;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) initCellData:(MemberFeeData *)bean
{
    labelName.text = bean.name;
    labelDate.text = bean.date;
    //labelIncome.text = bean.income;
    //labelExpense.text = bean.expense;
}

@end
