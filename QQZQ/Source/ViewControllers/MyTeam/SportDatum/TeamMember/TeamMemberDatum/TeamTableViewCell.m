//
//  TeamTableViewCell.m
//  QQZQ
//
//  Created by cafuc on 15/11/4.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "TeamTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation TeamTableViewCell

@synthesize imageView;
@synthesize labelSportName;
@synthesize labelSportTeam;
@synthesize labelPeopleNum;
@synthesize labelTime;



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) initCellDataSport:(TeamData *)bean
{
    NSLog(@"dddd");
    [imageView setImageWithURL:[NSURL URLWithString:bean.imageUrl] placeholderImage:[UIImage imageNamed:@"example1"]];
    //labelSportName.text = @"fff";
}


@end
