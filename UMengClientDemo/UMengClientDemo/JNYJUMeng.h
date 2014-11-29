//
//  JNYJUMeng.h
//  UMengClientDemo
//
//  Created by JNYJ on 14-11-29.
//  Copyright (c) 2014年 JNYJ. All rights reserved.
//

#import "JNYJ.h"
#import "UMessage.h"
#define UMSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define _IPHONE80_ 80000

/*
Need:

 - DEV Profiles - new for this bundle identifies
 - DEV profiles P12 - export for p12 file for UMeng - new for this bundle identifier

 - PRO Profiles - new for this bundle identifies
 - PRO profiles P12 - export for p12 file for UMeng - new for this bundle identifier

 
 */
@interface JNYJUMeng : JNYJ
+(void)didFinished_launchOptions:launchOptions;
+(void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
+(void)didReceiveRemoteNotification:(NSDictionary *)userInfo;
@end
