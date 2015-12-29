//
//  RechargeTableViewCell.h
//  QQZQ
//
//  Created by cafuc on 15/12/15.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RechargeData.h"


@interface RechargeTableViewCell : UITableViewCell

//钱数
@property (weak,nonatomic) IBOutlet UILabel *labelMoney;
//充值、提现、活动收入
@property (weak,nonatomic) IBOutlet UILabel *labelType;
//日期
@property (weak,nonatomic) IBOutlet UILabel *labelTime;

-(void) initCellData:(RechargeData *)bean;

@end
