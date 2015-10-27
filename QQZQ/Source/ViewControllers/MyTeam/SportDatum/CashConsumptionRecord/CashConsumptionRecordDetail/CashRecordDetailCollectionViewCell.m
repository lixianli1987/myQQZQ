//
//  CashRecordDetailCollectionViewCell.m
//  QQZQ
//
//  Created by cafuc on 15/10/17.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import "CashRecordDetailCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation CashRecordDetailCollectionViewCell

@synthesize labelName;
@synthesize imageViewPicture;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CashRecordDetailCollectionViewCell" owner:self options:nil];
        //如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        
        //如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]])
        {
            return nil;
        }
        
        //加载nib
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

-(void)initCellData:(CashData *)bean
{
    labelName.text = bean.name;
    [imageViewPicture setImageWithURL:[NSURL URLWithString:bean.imageUrl] placeholderImage:[UIImage imageNamed:@"example1"]];
}


@end
