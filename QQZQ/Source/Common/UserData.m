//
//  UserData.m
//  QQZQ
//
//  Created by cafuc on 15/11/14.
//  Copyright © 2015年 cafuc. All rights reserved.
//

#import "UserData.h"

@implementation UserData

@synthesize loginAccount;
@synthesize loginPassword;

static UserData *userInfo;

//单例方法
+ (UserData *)getUserData
{
    @synchronized(self) {
        if (!userInfo)
        {
            userInfo = [[UserData alloc] init];
        }
        
        return userInfo;
    }
}

//登录时初始化数据
- (void)initUserData:(NSString *)account password:(NSString *)password;
{
    //设置
    userInfo = [[UserData alloc] init];
    userInfo.loginAccount = account;
    userInfo.loginPassword = password;
}

//退出登录时，设置
- (void)signOutUser
{
    userInfo.loginAccount = @"";
    userInfo.loginPassword = @"";
}

@end
