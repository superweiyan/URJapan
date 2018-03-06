//
//  URPathUtils.m
//  URJapan
//
//  Created by lin weiyan on 06/03/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URPathUtils.h"

@implementation URPathUtils

+ (NSString *)getAppDir
{
    return NSHomeDirectory();
}

+ (NSString *)getDocumentDir
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)getLibraryDir
{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)getCacheDir
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)getTempDir
{
    return NSTemporaryDirectory();
}

+ (NSString *)getPreferencesDir
{
    return NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES).lastObject;
}
@end
