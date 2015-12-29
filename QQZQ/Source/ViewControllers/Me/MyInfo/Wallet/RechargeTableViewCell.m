//
//  RechargeTableViewCell.m
//  QQZQ
//
//  Created by cafuc on 15/12/15.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "RechargeTableViewCell.h"

@implementation RechargeTableViewCell

@synthesize labelMoney;
@synthesize labelType;
@synthesize labelTime;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) initCellData:(RechargeData *)bean
{
    labelMoney.text = bean.money;
    
    //充值、活动收入、提现、会员费、支付
    switch (bean.type) {
        case 0:
            labelType.text = @"充值";
            break;
            
        default:
            break;
    }
    //时间
    labelTime.text = bean.time;
}


@end
