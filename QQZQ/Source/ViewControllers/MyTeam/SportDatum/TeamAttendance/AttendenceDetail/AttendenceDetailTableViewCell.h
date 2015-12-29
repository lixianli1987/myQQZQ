//
//  AttendenceDetailTableViewCell.h
//  QQZQ
//
//  Created by cafuc on 15/11/7.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttendenceMemberData.h"

@interface AttendenceDetailTableViewCell : UITableViewCell

//图片
@property (weak,nonatomic) IBOutlet UIImageView *imageview;
//队员名称
@property (weak,nonatomic) IBOutlet UILabel *labelMemberName;
//出勤次数
@property (weak,nonatomic) IBOutlet UILabel *labelAttendanceTimes;
//积分
@property (weak,nonatomic) IBOutlet UILabel *labelScores;
//成立时间
@property (weak,nonatomic) IBOutlet UILabel *labelTime;
//出勤button
@property (weak,nonatomic) IBOutlet UIButton *buttonAttendence;
//迟到
@property (weak,nonatomic) IBOutlet UIButton *buttonLate;

-(void) initCellData:(AttendenceMemberData *)bean;

@end
