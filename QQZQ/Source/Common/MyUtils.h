//
//  MyUtils.h
//  QQZQ
//
//  Created by cafuc on 15/8/25.
//  Copyright (c) 2015年 cafuc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyUtils : NSObject

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

//屏幕宽度
#define SCREEN_WIDTH        [[UIScreen mainScreen] bounds].size.width
//屏幕高度
#define SCREEN_HEIGHT       [[UIScreen mainScreen] bounds].size.height
//屏幕宽度比例
#define SCREEN_RATIO        [[UIScreen mainScreen] bounds].size.width/320

//提示：没有更多数据
#define NO_MORE_DATA        @"没有更多数据"

//提示：没有更多数据
#define NET_ERROR        @"网络异常"

//图片前缀
#define IMG_PRIFIX  @"http://121.43.229.24/"  

//返回状态码
#define code_200     @"200"
#define code_201     @"201"
#define code_400     @"400"
#define code_401     @"401"
#define code_403     @"403"
#define code_500     @"500"


@end
