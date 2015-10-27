//
//  TeamMemberTableViewCell.m
//  QQZQ
//
//  Created by cafuc on 15/10/21.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "TeamMemberTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation TeamMemberTableViewCell


@synthesize imageView;
@synthesize labelMemberName;
@synthesize labelAttendanceTimes;
@synthesize labelScores;
@synthesize labelTime;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) initCellData:(MemberData *)bean
{
    [imageView setImageWithURL:[NSURL URLWithString:bean.imageUrl] placeholderImage:[UIImage imageNamed:@"example1"]];
    labelMemberName.text = bean.memberName;
    labelAttendanceTimes.text = bean.attendanceTimes;
    labelScores.text = bean.scores;
    labelTime.text = bean.time;
}

@end
