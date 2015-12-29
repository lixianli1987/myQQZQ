//
//  Common.m
//  QQZQ
//
//  Created by cafuc on 15/11/14.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "Common.h"

@implementation Common

/***********************************************************************
 * 方法名称： + (BOOL) isBlankString:(NSString *)string
 * 功能描述： 判断字符串string是否为空
 * 输入参数：
 * 输出参数：
 * 返 回 值：BOOL
 ***********************************************************************/
+ (BOOL)isBlankString:(NSString *)string
{
    if ((string == nil) || (string == NULL))
    {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0)
    {
        return YES;
    }
    
    return NO;
}

/***********************************************************************
 * 方法名称： + (NSString *)getSystemTime
 * 功能描述： 获取系统时间
 * 输入参数：
 * 输出参数：
 * 返 回 值：
 ***********************************************************************/
+ (NSString *)getSystemTime
{
    NSDate *senddate                = [NSDate date];
    
    NSDateFormatter *dateformatter  = [[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    
    NSString *locationString        = [dateformatter stringFromDate:senddate];
    return locationString;
}

/***********************************************************************
 * 方法名称： + (NSString *)getChangeTime:(NSData *)date
 * 功能描述： 转换时间
 * 输入参数：
 * 输出参数：
 * 返 回 值：
 ***********************************************************************/
+ (NSString *)getChangeTime:(NSDate *)date
{
    NSDateFormatter *dateformatter  = [[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    
    NSString *locationString        = [dateformatter stringFromDate:date];
    return locationString;
}


//时间转换
+ (NSString *)changeTimeIntervalToSysTime:(long long)time
{
    NSTimeInterval timeInterval = time/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSLog(@"转换成的系统时间:%@",date);
    
    NSDateFormatter *dateformatter  = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy年MM月dd日"];
    
    NSString *sysTime  = [dateformatter stringFromDate:date];
    NSLog(@"系统时间为:%@",sysTime);
    return sysTime;
}

@end
