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
#import "NSDictionary+URUtil.h"
#import "URConfigHelper.h"
#import "URLearnPhonogramModel.h"

@interface URPhonogramLevelService()

@property (nonatomic, strong) URPhonogramLearnService   * learnService;
@property (nonatomic, strong) URPhonogramTestService    * testService;

@property (nonatomic, strong) NSMutableDictionary *levelDict;
@property (nonatomic, strong) NSMutableDictionary *exampleDict;

@end

@implementation URPhonogramLevelService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.learnService = [[URPhonogramLearnService alloc] init];
        self.testService = [[URPhonogramTestService alloc] init];
        
        [self loadData];
    }
    return self;
}

- (NSArray *)getLearnLevelArray:(NSUInteger)level
{
    NSMutableArray *levelArray = [[NSMutableArray alloc] init];
    for (int i = 0; i <= level; i++) {
        NSString *key = [NSString stringWithFormat:@"level%ld", level];
        NSArray *array = [self.levelDict objectForKey:key];
        
        [levelArray addObjectsFromArray:array];
    }
    return levelArray;
}

- (URLearnPhonogramModel *)getLearnPhonogramItemInfo:(NSString *)key
{
    return [self.learnService getLearnPhonogramItemInfo:key];
}

- (NSArray *)getQuestionArray:(NSUInteger)level
{
    NSArray *keys = [self getLearnLevelArray:level];
    return [self.testService getTestQuestion:keys];
}

#pragma mark - init

- (void)loadData
{
    self.levelDict = [[NSMutableDictionary alloc] init];
    NSDictionary * levePathConfig = [URConfigHelper getConfigFromName:@"URPhonogramLessionConfig.geojson"];
    if (levePathConfig) {
        [self parseConfig:levePathConfig];
    }
}

- (void)parseConfig:(NSDictionary *)info
{
    NSUInteger count = [info getNumberForKey:@"levelCount"].integerValue;
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithFormat:@"level%d", i];
        NSArray *data = [info getArrayForKey:key];
        [self.levelDict setObject:data forKey:key];
    }
    [self parseData:info];
}

- (void)parseData:(NSDictionary *)info
{
    NSArray * data = [info getArrayForKey:@"data"];
    for (int i = 0; i < data.count; i++) {
        
        NSMutableArray *modeArray = [[NSMutableArray alloc] init];
        
        NSDictionary *value = [data objectAtIndex:i];
        NSArray *keysArray = value.allKeys;
        
        NSString *key = keysArray.firstObject;
        NSArray *descInfo = [value objectForKey:key];
        for (int j = 0; j < descInfo.count; j++) {
            NSDictionary *itemInfo = [descInfo objectAtIndex:j];
            [modeArray addObject:[self converToDict:itemInfo]];
        }
        
        [self.exampleDict setValue:modeArray forKey:key];
    }
    
    self.learnService.exampleDict = self.exampleDict;
}

#pragma mark - helper

- (URPhonogramExampleModel *)converToDict:(NSDictionary *)info
{
    URPhonogramExampleModel *mode = [[URPhonogramExampleModel alloc] init];
    NSString *phonogram = [info getStringForKey:@"key"];
    NSString *chinaDesc = [info getStringForKey:@"value"];
    mode.phonogram = phonogram;
    mode.chinaDesc = chinaDesc;
    return mode;
}


@end
