//
//  JNYJUMeng.m
//  UMengClientDemo
//
//  Created by JNYJ on 14-11-29.
//  Copyright (c) 2014年 JNYJ. All rights reserved.
//

#import "JNYJUMeng.h"


@implementation JNYJUMeng

+(void)didFinished_launchOptions:launchOptions{


	//set AppKey and LaunchOptions
	[UMessage startWithAppkey:@"5477f1b3fd98c57a8d000b39" launchOptions:launchOptions];

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= _IPHONE80_
	if(UMSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))
	{
		//register remoteNotification types
		UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc] init];
		action1.identifier = @"action1_identifier";
		action1.title=@"Accept";
		action1.activationMode = UIUserNotificationActivationModeForeground;//当点击的时候启动程序

		UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];  //第二按钮
		action2.identifier = @"action2_identifier";
		action2.title=@"Reject";
		action2.activationMode = UIUserNotificationActivationModeBackground;//当点击的时候不启动程序，在后台处理
		action2.authenticationRequired = YES;//需要解锁才能处理，如果action.activationMode = UIUserNotificationActivationModeForeground;则这个属性被忽略；
		action2.destructive = YES;

		UIMutableUserNotificationCategory *categorys = [[UIMutableUserNotificationCategory alloc] init];
		categorys.identifier = @"category1";//这组动作的唯一标示
		[categorys setActions:@[action1,action2] forContext:(UIUserNotificationActionContextDefault)];

		UIUserNotificationSettings *userSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert
																					 categories:nil];//[NSSet setWithObject:categorys]];
		[UMessage registerRemoteNotificationAndUserNotificationSettings:userSettings];

	} else{
	}
#else

	//register remoteNotification types
	[UMessage registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge
	 |UIRemoteNotificationTypeSound
	 |UIRemoteNotificationTypeAlert];
#endif





	//for log
	[UMessage setLogEnabled:YES];
}

+(void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
	[UMessage registerDeviceToken:deviceToken];
}
//
//如需关闭推送，请使用[UMessage unregisterForRemoteNotifications]
//
+(void)didReceiveRemoteNotification:(NSDictionary *)userInfo{
	[UMessage didReceiveRemoteNotification:userInfo];
}
@end
