//
//  Common.h
//  QQZQ
//
//  Created by cafuc on 15/11/14.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject

/***********************************************************************
 * 方法名称： + (BOOL) isBlankString:(NSString *)string
 * 功能描述： 判断字符串string是否为空
 * 输入参数：
 * 输出参数：
 * 返 回 值：BOOL
 ***********************************************************************/
+ (BOOL)isBlankString:(NSString *)string;

/***********************************************************************
 * 方法名称： + (NSString *)getSystemTime
 * 功能描述： 获取系统时间
 * 输入参数：
 * 输出参数：
 * 返 回 值：
 ***********************************************************************/
+ (NSString *)getSystemTime;


/***********************************************************************
 * 方法名称： + (NSString *)getChangeTime:(NSData *)date
 * 功能描述： 转换时间
 * 输入参数：
 * 输出参数：
 * 返 回 值：
 ***********************************************************************/
+ (NSString *)getChangeTime:(NSDate *)date;


/***********************************************************************
 * 方法名称： + (NSString *)changeTimeIntervalToSysTime
 * 功能描述： 将1970年后的秒数转换成系统格式时间
 * 输入参数：
 * 输出参数：
 * 返 回 值：
 ***********************************************************************/
+ (NSString *)changeTimeIntervalToSysTime:(long long)time;

@end
