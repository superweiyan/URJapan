//
//  URPhonogramLearnService.h
//  URJapan
//
//  Created by lin weiyan on 09/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class URLearnPhonogramModel;

@interface URPhonogramLearnService : NSObject

- (NSArray *)getLearnLevelArray:(NSUInteger)level;

- (URLearnPhonogramModel *)getLearnPhonogramItemInfo:(NSString *)key;

@end
