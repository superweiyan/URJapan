//
//  URLevelPathHelper.h
//  URJapan
//
//  Created by lin weiyan on 31/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface URPosition : NSObject

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@end;

@interface URLevelPathHelper : NSObject

+ (instancetype)sharedObject;

- (NSArray *)getAllLevelPosition;

- (URPosition *)getLevelPosition:(NSUInteger)level;

@end
