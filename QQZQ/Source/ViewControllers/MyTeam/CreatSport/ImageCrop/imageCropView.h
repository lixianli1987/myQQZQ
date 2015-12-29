//
//  imageCropView.h
//  BookReview
//
//  Created by readygo-tec on 15/3/17.
//  Copyright (c) 2015年 Readygo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface imageCropView : UIView<UIGestureRecognizerDelegate>
{
    CGSize _originalImageViewSize;
}

//初始化放在view上的图片
@property (strong,nonatomic) UIImage *images;

//剪切后的图片
@property (strong,nonatomic) UIImage *croppedImage;

//imageView
@property (strong,nonatomic) UIImageView *imageView;

//剪切图片区域设置
@property (strong,nonatomic) UIView *cropView;


//初始化设置view
-(void) setInit;

//剪切动作
-(void) finishCropping;

//复原
-(void) reset;

//设置图片
-(void) setImage:(UIImage *)image;

@end
