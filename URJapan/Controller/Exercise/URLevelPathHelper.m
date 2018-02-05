//
//  URLevelPathHelper.m
//  URJapan
//
//  Created by lin weiyan on 31/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URLevelPathHelper.h"
#import "URConfigHelper.h"
#import "NSDictionary+URUtil.h"

@implementation URPosition
@end

@interface URLevelPathHelper()

@property (nonatomic, strong) NSArray  *levelPathArray;

@end

@implementation URLevelPathHelper

+ (instancetype)sharedObject
{
    static dispatch_once_t __once;
    static URLevelPathHelper * __instance = nil;
    dispatch_once(&__once, ^{
        __instance = [[URLevelPathHelper alloc] init];
    });
    return __instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSDictionary * levePathConfig = [URConfigHelper getConfigFromName:@"LevelPath.geojson"];
        if (levePathConfig) {
            [self parseConfig:levePathConfig];
        }
    }
    return self;
}

- (void)parseConfig:(NSDictionary *)config
{
    NSMutableArray *configArray = [[NSMutableArray alloc] init];
    
    NSArray *levelConfig = [config getArrayForKey:@"level"];
    for (int i = 0 ; i < levelConfig.count; i++) {
        NSDictionary *level = [levelConfig objectAtIndex:i];
        CGFloat x = [level getNumberForKey:@"x"].floatValue;
        CGFloat y = [level getNumberForKey:@"y"].floatValue;
        URPosition *position = [[URPosition alloc] init];
        position.x = x;
        position.y = y;
        [configArray addObject:position];
    }
    
    self.levelPathArray = configArray;
}

- (NSArray *)getAllLevelPosition
{
    return self.levelPathArray;
}

- (URPosition *)getLevelPosition:(NSUInteger)level
{
    if (level < self.levelPathArray.count) {
        return [self.levelPathArray objectAtIndex:level];
    }
    return nil;
}

@end
