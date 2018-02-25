//
//  URRecordService.m
//  URJapan
//
//  Created by lin weiyan on 25/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URRecordService.h"

@implementation URRecordService

- (void)markPastLevel:(NSUInteger)level type:(NSString *)testTypeId
{
    NSString *key = [NSString stringWithFormat:@"%@_test_level", testTypeId];
    [[NSUserDefaults standardUserDefaults] setInteger:level forKey:key];
}

- (NSUInteger)getPastLevel:(NSString *)testTypeId
{
    NSString *key = [NSString stringWithFormat:@"%@_test_level", testTypeId];
    NSNumber *value = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    return value.integerValue;
}

@end
