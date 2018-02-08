//
//  URLevelSelectView.h
//  URJapan
//
//  Created by lin weiyan on 05/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, URLevelType) {
    URLevelType_Learn = 0,
    URLevelType_Test = 1
};

typedef void (^onLevelClickCallback)(URLevelType levelType, NSUInteger level);

@interface URLevelSelectView : UIView

@property (nonatomic, assign) NSUInteger level;

@property (nonatomic, copy) onLevelClickCallback levelClickback;

@end
