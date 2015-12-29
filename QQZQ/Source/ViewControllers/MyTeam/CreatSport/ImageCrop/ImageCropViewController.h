//
//  ImageCropViewController.h
//  BookReview
//
//  Created by readygo-tec on 15/3/17.
//  Copyright (c) 2015年 Readygo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageCropViewControllerDelegate <NSObject>

@required

- (void)receveiImageWhenBack:(UIImage *)image;

@end

@interface ImageCropViewController : UIViewController

//返回按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonBack;
//确定按钮
@property (weak,nonatomic) IBOutlet UIButton *buttonSure;


@property (strong, nonatomic) id<ImageCropViewControllerDelegate> delegate;

@property (strong,nonatomic) UIImage *reveivedImg;


//响应按钮方法
-(IBAction)clickBtn:(id)sender;

@end
