//
//  URPhonogramService.m
//  URJapan
//
//  Created by lin weiyan on 11/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URPhonogramService.h"
#import "URConfigHelper.h"
#import "URPhonogramModel.h"
#import "NSDictionary+URUtil.h"

@interface URPhonogramService()

@property (nonatomic, strong) NSMutableDictionary    *phonogramDict;

@end

@implementation URPhonogramService

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
        [self loadData];
    }
    return self;
}

- (void)initData
{
    self.vowelArray = @[@"a", @"i", @"u", @"e", @"o"];
    self.phonogramHorizontalArray = @[@"a", @"k", @"s", @"t", @"n", @"h", @"m", @"y", @"r", @"w"];
}

- (void)loadData
{
    NSDictionary *json = [URConfigHelper getConfigFromName:@"Kana.config.geojson"];
    
    self.phonogramArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.phonogramHorizontalArray.count; i++) {
        NSString *val = [self.phonogramHorizontalArray objectAtIndex:i];
        NSArray *itemArray = [json objectForKey:val];
        
        for (int j = 0; j < itemArray.count; j++) {
            NSArray *item = [itemArray objectAtIndex:j];
            URPhonogramModel *model = [URPhonogramModel converFromArray:item];
            if (model) {
                if (![self.phonogramDict objectForKey:model.phonogram]) {
                    [self.phonogramDict setValue:model forKey:model.phonogram];
                }
                [self.phonogramArray addObject:model];
            }
        }
    }
}

- (NSMutableDictionary *)phonogramDict
{
    if (!_phonogramDict) {
        _phonogramDict = [[NSMutableDictionary alloc] init];
    }
    return _phonogramDict;
}

//    NSMutableArray * phonogramArray = [[NSMutableArray alloc] init];
//    for (int i = 0; i < self.phonogramHorizontalArray.count; i++) {
//        NSString *val = [self.phonogramHorizontalArray objectAtIndex:i];
//
//        for (int j = 0; j < itemArray.count; j++) {
//            NSArray *item = [itemArray objectAtIndex:j];
//            URPhonogramModel *model = [URPhonogramModel converFromArray:item];
//            [phonogramArray addObject:model];
//        }
//    }
//    return phonogramArray;
//}

- (URPhonogramModel *)getPhonogramInfo:(NSString *)key
{
    URPhonogramModel *item = [self.phonogramDict objectForKey:key];
    if (!item) {
        return nil;
    }
    
    return item;
}

@end
