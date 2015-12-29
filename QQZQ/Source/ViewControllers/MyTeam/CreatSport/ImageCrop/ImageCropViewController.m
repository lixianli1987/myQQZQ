//
//  ImageCropViewController.m
//  BookReview
//
//  Created by readygo-tec on 15/3/17.
//  Copyright (c) 2015年 Readygo. All rights reserved.
//

#import "ImageCropViewController.h"
#import "imageCropView.h"

#define IMG_CROP @"头像上传页面"

@interface ImageCropViewController ()
{
    imageCropView *imagecropview;

}

@end

@implementation ImageCropViewController

@synthesize delegate;
@synthesize reveivedImg;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //imagecropview = [[imageCropView alloc] initWithFrame:self.view.frame];
    imagecropview = [[imageCropView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 50)];
    imagecropview.layer.borderWidth = 1.0;
    imagecropview.layer.borderColor = [UIColor clearColor].CGColor;
    [imagecropview setInit];
    [imagecropview setImage:reveivedImg];
    
    [self.view addSubview:imagecropview];
}


-(void) clickBtn:(id)sender
{
    UIButton *tmpBtn = (UIButton *)sender;
    
    //tag = 10
    //点击了返回按钮
    switch (tmpBtn.tag) {
        case 10:
            NSLog(@"点击了返回按钮");
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 11:
            NSLog(@"点击了确定按钮");
            //提交数据
            [self cliBtnSure];
            break;
            
        default:
            break;
    }
    
}


-(void)cliBtnSure
{
    //开始剪切图片
    [imagecropview finishCropping];
    
    //剪切了图片后
    //返回到编辑页面显示
    if (delegate)
    {
        NSLog(@"执行了没?");
        [self.delegate receveiImageWhenBack:imagecropview.croppedImage];
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
