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

typedef void (^onLevelClickCallback)(URLevelType);

@interface URLevelSelectView : UIView

@property (nonatomic, copy) onLevelClickCallback levelClickback;

@end
