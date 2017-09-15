//
//  URLogger.m
//  URJapan
//
//  Created by weiyan on 15/09/2017.
//  Copyright © 2017 URWY. All rights reserved.
//

#import "URLogger.h"
#import "CocoaLumberjack/CocoaLumberjack.h"

static const DDLogLevel ddLogLevel = DDLogLevelInfo;

@interface URLogger()
{
    
}
@end

@implementation URLogger

+ (URLogger *)shareObject
{
    static URLogger * _shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_shareInstance) {
            _shareInstance = [[self alloc] init];
        }
    });
    
    return _shareInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [DDLog addLogger:[DDTTYLogger sharedInstance]];
        
        DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
        [fileLogger setMaximumFileSize:1024 * 1024 * 5];
        [[fileLogger logFileManager] setMaximumNumberOfLogFiles:1];
        [DDLog addLogger:fileLogger];
    }
    return self;
}

+ (void)log:(NSString *)info tag:(NSString *)tag func:(NSString *)funcation line:(int32_t)line
{
    NSString *format = [NSString stringWithFormat:@"[%@] %@ [_%@_][_%d_]", tag, info, funcation, line];
    DDLogInfo(@"%@", format);
}

@end
