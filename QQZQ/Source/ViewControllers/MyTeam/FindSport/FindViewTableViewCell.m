//
//  FindViewTableViewCell.m
//  QQZQ
//
//  Created by cafuc on 15/9/10.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "FindViewTableViewCell.h"
#import "UIImageView+AFNetworking.h"


@implementation FindViewTableViewCell

@synthesize imageView;
@synthesize labelSportName;
@synthesize labelSportLeader;
@synthesize labelSportNumber;
@synthesize labelSportEstablishTime;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void) initCellData:(FindViewData *)bean
{
    [imageView setImageWithURL:[NSURL URLWithString:bean.imageUrl] placeholderImage:[UIImage imageNamed:@"example1"]];
    //labelSportName.text = bean.teamName;
    //labelSportLeader.text = bean.teamLeader;
    //labelSportNumber.text = bean.teamNumber;
    //labelSportEstablishTime.text = bean.establishTime;
}


@end
