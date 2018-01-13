//
//  URSystemUtils.h
//  URJapan
//
//  Created by lin weiyan on 12/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//typedef NS_ENUM(NSUInteger, URiPhoneSize) {
//    URiPhoneSize_320_480 = 0,
//    URiPhoneSize_320_568 = 1,   //iPhone 5, 5s
//    URiPhoneSize_375_667 = 2,   //iPhone 6, 6s, 7
//    URiPhoneSize_414_736 = 3,   //iPhone6plus, 6splus, 7plus
//    URiPhoneSize_375_734 = 4,   //iPhoneX
//};

@interface URSystemUtils : NSObject

+ (CGSize)getiPhoneSize;

@end
