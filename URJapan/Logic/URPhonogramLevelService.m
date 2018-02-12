//
//  URPhonogramLevelService.m
//  URJapan
//
//  Created by lin weiyan on 12/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URPhonogramLevelService.h"
#import "URPhonogramTestService.h"
#import "URPhonogramLearnService.h"

@interface URPhonogramLevelService()

@property (nonatomic, strong) URPhonogramLearnService   * learnService;
@property (nonatomic, strong) URPhonogramTestService    * testService;

@end

@implementation URPhonogramLevelService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.learnService = [[URPhonogramLearnService alloc] init];
        self.testService = [[URPhonogramTestService alloc] init];
    }
    return self;
}

- (NSArray *)getLearnLevelArray:(NSUInteger)level
{
    
}

- (URLearnPhonogramModel *)getLearnPhonogramItemInfo:(NSString *)key
{
    
}


@end
