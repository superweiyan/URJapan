//
//  URRecordService.h
//  URJapan
//
//  Created by lin weiyan on 25/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URRecordService : NSObject

- (void)markPastLevel:(NSUInteger)level type:(NSString *)testTypeId;

- (NSUInteger)getPastLevel:(NSString *)testTypeId;

@end
