//
//  URLogger.h
//  URJapan
//
//  Created by weiyan on 15/09/2017.
//  Copyright © 2017 URWY. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, URLoggerLevelType) {
    URLoggerLevelTypeInfo = 0,
    URLoggerLevelTypeWarn = 1,
    URLoggerLevelTypeError = 2
};

#define LOGGER(__Info__) [URLogger log:__Info__ tag:@""  func:NSStringFromSelector(_cmd) line:__LINE__];

#define LOGGER_TAG(__Info__, __Tag__) [URLogger log:__Info__ tag:__Tag__  func:__FUNCTION__ line:__LINE__];

@interface URLogger : NSObject

+ (URLogger *)shareObject;

+ (void)log:(NSString *)info tag:(NSString *)tag func:(NSString *)funcation line:(int32_t)line;

@end
