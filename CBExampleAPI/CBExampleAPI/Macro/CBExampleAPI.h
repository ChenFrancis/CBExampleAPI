//
//  CBExampleAPI.h
//  CBExampleAPI
//
//  Created by xychen on 14-6-17.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#ifndef CBExampleAPI_CBExampleAPI_h
#define CBExampleAPI_CBExampleAPI_h

#pragma mark - 应用程序尺寸

#define KAppSize [UIScreen mainScreen].applicationFrame.size
#define KAppWidth [UIScreen mainScreen].applicationFrame.size.width
#define KAppHeight [UIScreen mainScreen].applicationFrame.size.height

#pragma mark - 系统信息

#define KIsIOS7 [[[UIDevice currentDevice] systemVersion]floatValue]>=7.0

#endif
