//
//  HistoryActivityTableViewCell.m
//  QQZQ
//
//  Created by cafuc on 15/12/18.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "HistoryActivityTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation HistoryActivityTableViewCell

@synthesize imageUrl;
@synthesize labelActivityName;
@synthesize labelActivityLocation;
@synthesize labelActivityTime;
@synthesize labelActivityType;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) initCellData:(SportInnerData *)bean
{
    [imageUrl setImageWithURL:[NSURL URLWithString:bean.imageUrl] placeholderImage:[UIImage imageNamed:@"example1"]];
    labelActivityName.text = bean.activityName;
    labelActivityLocation.text = bean.activityLocation;
    labelActivityTime.text = bean.activityTime;
    labelActivityType.text = bean.activityType;
    
}

@end
