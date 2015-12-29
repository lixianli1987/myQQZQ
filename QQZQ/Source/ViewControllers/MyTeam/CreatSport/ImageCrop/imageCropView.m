//
//  imageCropView.m
//  BookReview
//
//  Created by readygo-tec on 15/3/17.
//  Copyright (c) 2015年 Readygo. All rights reserved.
//

#import "imageCropView.h"

@implementation imageCropView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@synthesize images;
@synthesize croppedImage;
@synthesize imageView;
@synthesize cropView;


//view的初始化设置
-(void)setInit
{
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor clearColor];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    imageView.userInteractionEnabled = YES;
    [self addSubview:imageView];
    
    //设置剪切图片view的尺寸大小
    cropView = [[UIView alloc] initWithFrame:CGRectMake(80, 80, 200, 200)];
    cropView.layer.borderWidth = 1.0;
    cropView.layer.borderColor = [UIColor redColor].CGColor;
    cropView.userInteractionEnabled = NO;
    [self addSubview:cropView];
    
    //将捏合手势、平移手势加到imageView上
    UIPinchGestureRecognizer *scaleGes = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scaleImage:)];
    [scaleGes setDelegate:self];
    [imageView addGestureRecognizer:scaleGes];
    
    UIPanGestureRecognizer *moveGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveImage:)];
    [moveGes setMinimumNumberOfTouches:1];
    [moveGes setMaximumNumberOfTouches:1];
    [imageView addGestureRecognizer:moveGes];
}

//设置图片
-(void)setImage:(UIImage *)image
{
    if (images != image)
    {
        images = image ;
    }
    
    float _imageScale = self.frame.size.width/image.size.width;
    NSLog(@"比例尺寸:%f",_imageScale);
    self.imageView.frame = CGRectMake(0, 0, image.size.width*_imageScale, image.size.height*_imageScale);
    _originalImageViewSize = CGSizeMake(image.size.width*_imageScale, image.size.height*_imageScale);
    imageView.image = image;
    imageView.center = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
    
}

//捏合
float _lastScale = 1.0;
-(void)scaleImage:(UIPinchGestureRecognizer *)sender
{
    NSLog(@"捏合");
    if ([sender state] == UIGestureRecognizerStateBegan)
    {
        //初始化捏合设为1
        _lastScale = 1.0;
        return;
    }
    //新系数
    CGFloat scale = [sender scale]/_lastScale;
    
    //目前轮廓
    CGAffineTransform currentTransform = imageView.transform;
    //新轮廓--放大或缩小
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    [imageView setTransform:newTransform];
    
    //保持最新捏合系数
    _lastScale = [sender scale];
    NSLog(@"最新捏合系数:%f",_lastScale);
    
}


//平移
float _lastX = 0.0;
float _lastY = 0.0;
-(void)moveImage:(UIPanGestureRecognizer *)sender
{
    CGPoint translatedPoint = [sender translationInView:self];
    if ([sender state] == UIGestureRecognizerStateBegan)
    {
        _lastX = 0.0;
        _lastY = 0.0;
    }
    CGAffineTransform trans = CGAffineTransformMakeTranslation(translatedPoint.x - _lastX, translatedPoint.y -_lastY);
    CGAffineTransform newTransform = CGAffineTransformConcat(imageView.transform, trans);
    
    _lastX = translatedPoint.x;
    _lastY = translatedPoint.y;
    
    //在这里加边界范围
    //通过判断该view的高度来添加具体的边界范围
    if (newTransform.tx > 300)
    {
        newTransform.tx = 300;
    }
    else if (newTransform.tx < -300)
    {
        newTransform.tx = -300;
    }
    
    if (newTransform.ty > 450)
    {
        newTransform.ty = 450;
    }
    else if (newTransform.ty < -450)
    {
        newTransform.ty = -450;
    }
    imageView.transform = newTransform;
}

//剪切
-(void)finishCropping
{
    float zoomScale = [[self.imageView.layer valueForKeyPath:@"transform.scale.x"] floatValue];
    NSLog(@"缩放比例:%f",zoomScale);
    float _imageScale = images.size.width/self.frame.size.width;
    CGSize cropSize = CGSizeMake(200/zoomScale, 200/zoomScale);
    CGPoint cropperViewOrigin = CGPointMake((75.0 - self.imageView.frame.origin.x)/zoomScale, (75.0 - self.imageView.frame.origin.y)/zoomScale);

    //取整
    if((NSInteger)cropSize.width % 2 == 1)
    {
        //ceil返回大于或等于表达式的最小整数
        cropSize.width = ceil(cropSize.width);
    }
    if((NSInteger)cropSize.height % 2 == 1)
    {
        cropSize.height = ceil(cropSize.height);
    }
    
    //剪切图片尺寸
    CGRect CropRectinImage = CGRectMake((NSInteger)(cropperViewOrigin.x*_imageScale) ,(NSInteger)( cropperViewOrigin.y*_imageScale), (NSInteger)(cropSize.width*_imageScale),(NSInteger)(cropSize.height*_imageScale));
    //图片合成
    CGImageRef tmp = CGImageCreateWithImageInRect([self.images CGImage], CropRectinImage);
    self.croppedImage = [UIImage imageWithCGImage:tmp scale:self.images.scale orientation:self.images.imageOrientation];
}

//复原
-(void)reset
{
    self.imageView.transform = CGAffineTransformIdentity;
}



@end
