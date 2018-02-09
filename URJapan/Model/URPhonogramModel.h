//
//  URPhonogramModel.h
//  URJapan
//
//  Created by lin weiyan on 11/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URPhonogramModel : NSObject

@property (nonatomic, strong) NSString  * phonogram;    //音符
@property (nonatomic, strong) NSString  * kata;         // 片假名
@property (nonatomic, strong) NSString  * Hiragana;     // 平假名

//+ (URPhonogramModel *)converFromJson:(NSDictionary *)json;

+ (URPhonogramModel *)converFromArray:(NSArray *) array;

@end
