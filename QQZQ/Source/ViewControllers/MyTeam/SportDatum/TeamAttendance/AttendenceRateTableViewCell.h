//
//  AttendenceRateTableViewCell.h
//  QQZQ
//
//  Created by cafuc on 15/11/6.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttendenceStatistics.h"

@interface AttendenceRateTableViewCell : UITableViewCell

//图片
@property (weak,nonatomic) IBOutlet UIImageView *imageview;
//名称
@property (weak,nonatomic) IBOutlet UILabel *lableName;
//参赛次数
@property (weak,nonatomic) IBOutlet UILabel *lablePaticipantTimes;
//出勤率
@property (weak,nonatomic) IBOutlet UILabel *lablePaticipantRate;

-(void) initCellData:(AttendenceStatistics *)bean;

@end
