//
//  URPathUtils.h
//  URJapan
//
//  Created by lin weiyan on 06/03/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URPathUtils : NSObject

// 获取应用程序目录的路径.
+ (NSString *)getAppDir;

// 获取Documents目录路径, itunes 会拷贝
+ (NSString *)getDocumentDir;

// 获取Library的目录路径,
+ (NSString *)getLibraryDir;

// 获取Caches目录路径
+ (NSString *)getCacheDir;

// 获取tmp目录路径  //临时文件，重启会删掉
+ (NSString *)getTempDir;

// Library/Preferences/ 目录保存应用程序的所有偏好设置. itunes会备份
+ (NSString *)getPreferencesDir;


@end
