//
//  URPhonogramLevelService.h
//  URJapan
//
//  Created by lin weiyan on 12/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URPhonogramLevelService : NSObject

- (NSArray *)getLearnLevelArray:(NSUInteger)level;

- (URLearnPhonogramModel *)getLearnPhonogramItemInfo:(NSString *)key;

@end
