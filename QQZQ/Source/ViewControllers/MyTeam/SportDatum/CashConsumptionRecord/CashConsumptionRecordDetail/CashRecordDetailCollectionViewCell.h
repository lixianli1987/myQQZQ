//
//  CashRecordDetailCollectionViewCell.h
//  QQZQ
//
//  Created by cafuc on 15/10/17.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CashData.h"


@interface CashRecordDetailCollectionViewCell : UICollectionViewCell

@property (weak,nonatomic) IBOutlet UILabel *labelName;
@property (weak,nonatomic) IBOutlet UIImageView *imageViewPicture;

-(void)initCellData:(CashData *)bean;

@end
