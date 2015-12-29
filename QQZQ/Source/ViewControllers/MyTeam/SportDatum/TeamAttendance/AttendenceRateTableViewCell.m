//
//  AttendenceRateTableViewCell.m
//  QQZQ
//
//  Created by cafuc on 15/11/6.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "AttendenceRateTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation AttendenceRateTableViewCell

@synthesize imageView;
@synthesize lableName;
@synthesize lablePaticipantTimes;
@synthesize lablePaticipantRate;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) initCellData:(AttendenceStatistics *)bean
{
    [imageView setImageWithURL:[NSURL URLWithString:bean.imageUrl] placeholderImage:[UIImage imageNamed:@"example1"]];
    lableName.text = bean.name;
    lablePaticipantTimes.text = bean.times;
    lablePaticipantRate.text = bean.paticipantRate;
}


@end
