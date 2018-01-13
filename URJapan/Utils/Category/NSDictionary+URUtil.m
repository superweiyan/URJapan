//
//  NSDictionary+URUtil.m
//  URJapan
//
//  Created by lin weiyan on 11/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "NSDictionary+URUtil.h"

@implementation NSDictionary (URUtil)

id URSafeGet(NSDictionary *dic, Class cls, id key)
{
    if (![dic isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    if (key == nil) {
        return nil;
    }
    
    id val = [dic objectForKey:key];
    if ([val isKindOfClass:cls]) {
        return val;
    }
    return nil;
}


- (void)setValue:(id)value forKey:(NSString *)key
{
    if (value == [NSNull null] || value == nil) {
        return ;
    }
    
    [super setValue:value forKey:key];
}

- (NSString *)getStringForKey:(NSString *)key
{
    return URSafeGet(self, [NSString class], key);
}

- (NSNumber *)getNumberForKey:(NSString *)key
{
    return URSafeGet(self, [NSNumber class], key);
}

- (NSArray *)getArrayForKey:(NSString *)key
{
    return URSafeGet(self, [NSArray class], key);
}

- (NSDictionary *)getDictForKey:(NSString *)key
{
    return URSafeGet(self, [NSDictionary class], key);
}

@end
