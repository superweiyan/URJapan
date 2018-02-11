//  50音图的基础服务组件
//  可以被其它组件所依赖
//  URPhonogramService.h
//  URJapan
//
//  Created by lin weiyan on 11/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class URPhonogramModel;

@interface URPhonogramService : NSObject

@property (nonatomic, strong) NSArray                *vowelArray; //元音数组 
@property (nonatomic, strong) NSArray                *phonogramHorizontalArray;
@property (nonatomic, strong) NSMutableArray         *phonogramArray;

- (URPhonogramModel *)getPhonogramInfo:(NSString *)key;

@end
