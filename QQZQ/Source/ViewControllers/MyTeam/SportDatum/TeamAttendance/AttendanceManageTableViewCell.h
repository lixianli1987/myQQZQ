//
//  AttendanceManageTableViewCell.h
//  QQZQ
//
//  Created by cafuc on 15/11/5.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttendenceManageData.h"


@interface AttendanceManageTableViewCell : UITableViewCell

//出勤名称
@property (weak,nonatomic) IBOutlet UILabel *labelAttendenceName;
//出勤时间
@property (weak,nonatomic) IBOutlet UILabel *labelAttendenceTime;
//报名人数
@property (weak,nonatomic) IBOutlet UILabel *labelAttendenceNum;
//实际出勤人数
@property (weak,nonatomic) IBOutlet UILabel *labelAttendenceRealNum;

-(void) initCellData:(AttendenceManageData *)bean;

@end
