//
//  AttendenceDetailTableViewCell.m
//  QQZQ
//
//  Created by cafuc on 15/11/7.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "AttendenceDetailTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation AttendenceDetailTableViewCell

@synthesize imageView;
@synthesize labelMemberName;
@synthesize labelAttendanceTimes;
@synthesize labelScores;
@synthesize labelTime;
@synthesize buttonAttendence;
@synthesize buttonLate;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) initCellData:(AttendenceMemberData *)bean
{
    [imageView setImageWithURL:[NSURL URLWithString:bean.imageUrl] placeholderImage:[UIImage imageNamed:@"example1"]];
    labelMemberName.text = bean.memberName;
    labelAttendanceTimes.text = bean.attendanceTimes;
    labelScores.text = bean.scores;
    labelTime.text = bean.time;
}

@end
