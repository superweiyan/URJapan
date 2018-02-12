//
//  URService.m
//  URJapan
//
//  Created by lin weiyan on 12/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URService.h"
//#import "URPhonogramTestService.h"
#import "URPhonogramLevelService.h"

@implementation URService

+ (URService *)shareObbject
{
    static URService *__instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        __instance = [[URService alloc] init];
    });
    return __instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.phonogramService = [[URPhonogramService alloc] init];
//        self.phonogramLearnService = [[URPhonogramLearnService alloc] init];
    }
    return self;
}

- (URPhonogramLevelService *)phonoGramlevalService
{
    if (!_phonoGramlevalService) {
        _phonoGramlevalService = [[URPhonogramLevelService alloc] init];
    }
    return _phonoGramlevalService;
}

@end
