//
//  URPhonogramLearnService.m
//  URJapan
//
//  Created by lin weiyan on 09/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URPhonogramLearnService.h"
#import "URLearnPhonogramModel.h"
#import "URConfigHelper.h"
#import "NSDictionary+URUtil.h"
#import "URPhonogramService.h"
#import "URService.h"

@interface URPhonogramLearnService()

@property (nonatomic, strong) NSMutableDictionary *levelDict;
@property (nonatomic, strong) NSMutableDictionary *exampleDict;

@end

@implementation URPhonogramLearnService

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadData];
    }
    return self;
}

- (URLearnPhonogramModel *)getLearnPhonogramItemInfo:(NSString *)key
{
    URPhonogramModel * model = [[URService shareObbject].phonogramService getPhonogramInfo:key];
    NSArray *exampleModel = [self.exampleDict objectForKey:key];
    
    URLearnPhonogramModel *learnModel = [[URLearnPhonogramModel alloc] init];
    learnModel.phonogramModel = model;
    learnModel.exampleArray = exampleModel;
    return learnModel;
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

#pragma mark - load

- (void)loadData
{
    self.levelDict = [[NSMutableDictionary alloc] init];
    self.exampleDict = [[NSMutableDictionary alloc] init];
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
}

#pragma mark - action


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
