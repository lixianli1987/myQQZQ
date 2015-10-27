/*********************************************************************
 * 版权所有 QQZQ
 *
 * 文件名称： WebServiceHost.h 请求地址管理类
 * 内容摘要： 请求地址管理类
 * 其它说明： 头文件
 * 作 成 者： LXL
 * 完成日期： 2015年07月22日
 * 修改记录1：
 * 修改日期：
 * 修 改 人：
 * 修改内容：
 * 修改记录2：
 **********************************************************************/

#import <Foundation/Foundation.h>

@interface WebServiceHost : NSObject

//阿里云
// http://121.43.229.24:8080/qqzq

//服务器地址
#define WEB_SERVER @"121.43.229.24"
//#define WEB_SERVER @"192.168.2.101"
#define WEB_PORT @":8080"
#define WEB_SERVICE_HOST [NSString stringWithFormat:@"http://%@%@/qqzq/rest/authc", WEB_SERVER,WEB_PORT]

//登陆
#define WEB_SERVICE_LOGIN [NSString stringWithFormat:@"%@/login", WEB_SERVICE_HOST]

//获取验证码
#define WEB_SERVICE_GETYZM [NSString stringWithFormat:@"%@/verifycode", WEB_SERVICE_HOST]

//注册
#define WEB_SERVICE_GEGISTER [NSString stringWithFormat:@"%@/register", WEB_SERVICE_HOST]

//获取我的球队
#define WEB_SERVICE_GETMYTEAM(userId) [NSString stringWithFormat:@"%@/getMyTeam%@userId=%@", WEB_SERVICE_HOST,@"?",userId]

@end
