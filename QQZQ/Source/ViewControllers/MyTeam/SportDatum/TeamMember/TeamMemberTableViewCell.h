//
//  TeamMemberTableViewCell.h
//  QQZQ
//
//  Created by cafuc on 15/10/21.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberData.h"

@interface TeamMemberTableViewCell : UITableViewCell

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

-(void) initCellData:(MemberData *)bean;

@end
