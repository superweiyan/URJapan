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

@property (nonatomic, strong) NSDictionary *phonogramDict;
@property (nonatomic, strong) NSArray       *phonogramArray;
@property (nonatomic, strong) NSArray       *phonogramHorizontalArray;

@end

@implementation URPhonogramService

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData
{
    self.phonogramArray = @[@"a", @"i", @"u", @"e", @"o"];
    self.phonogramHorizontalArray = @[@"a", @"k", @"s", @"t", @"n", @"h", @"m", @"y", @"r", @"w"];
}

- (NSDictionary *)phonogramDict
{
    if (!_phonogramDict) {
        _phonogramDict = [URConfigHelper getConfigFromName:@"Kana.config.geojson"];
    }
    return _phonogramDict;
}

- (NSArray *)getFiftyPhonogram
{
    NSMutableArray * phonogramArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.phonogramHorizontalArray.count; i++) {
        NSString *val = [self.phonogramHorizontalArray objectAtIndex:i];
        NSArray *itemArray = [self.phonogramDict objectForKey:val];
        
        for (int j = 0; j < itemArray.count; j++) {
            NSArray *item = [itemArray objectAtIndex:j];
            URPhonogramModel *model = [URPhonogramModel converFromArray:item];
            [phonogramArray addObject:model];
        }
    }
    return phonogramArray;
}

@end
