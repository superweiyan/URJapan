//
//  URTTSHelper.h
//  URJapan
//
//  Created by lin weiyan on 11/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @"zh_CN";  中文
 *  @"ja-JP" 日文
 *  @"en-US" 英文
 *  @"zh-HK" 粤语
 */

@interface URTTSHelper : NSObject

@property (nonatomic, strong) NSString *language;
@property (nonatomic, assign) float rate;    //[0.0~1.0];
@property (nonatomic, assign) float volume;  //

- (void)playText:(NSString *)text;

@end
