//
//  AttendanceManageTableViewCell.m
//  QQZQ
//
//  Created by cafuc on 15/11/5.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "AttendanceManageTableViewCell.h"


@implementation AttendanceManageTableViewCell

//出勤名称
@synthesize labelAttendenceName;
//出勤时间
@synthesize labelAttendenceTime;
//报名人数
@synthesize labelAttendenceNum;
//实际出勤人数
@synthesize labelAttendenceRealNum;



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) initCellData:(AttendenceManageData *)bean
{
    labelAttendenceName.text = bean.attendenceName;
    labelAttendenceTime.text = bean.attendenceTime;
    labelAttendenceNum.text = bean.attendenceNum;
    labelAttendenceRealNum.text = bean.attendenceRealNum;
}

@end
