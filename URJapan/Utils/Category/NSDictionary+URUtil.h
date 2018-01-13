//
//  NSDictionary+URUtil.h
//  URJapan
//
//  Created by lin weiyan on 11/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (URUtil)

- (void)setValue:(id)value forKey:(NSString *)key;

- (NSString *)getStringForKey:(NSString *)key;

- (NSNumber *)getNumberForKey:(NSString *)key;

- (NSArray *)getArrayForKey:(NSString *)key;

- (NSDictionary *)getDictForKey:(NSString *)key;

@end
