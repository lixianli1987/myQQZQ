//
//  MemberFeeManageTableViewCell.h
//  QQZQ
//
//  Created by cafuc on 15/10/18.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberFeeData.h"

@interface MemberFeeManageTableViewCell : UITableViewCell

@property (weak,nonatomic) IBOutlet UILabel *labelName;
@property (weak,nonatomic) IBOutlet UILabel *labelDate;
@property (weak,nonatomic) IBOutlet UILabel *labelIncome;
@property (weak,nonatomic) IBOutlet UILabel *labelExpense;


-(void) initCellData:(MemberFeeData *)bean;

@end
