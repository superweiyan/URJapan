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
    URLevelType_Test = 1,
    URLevelType_FaultWord = 2
};

@protocol URLevelSelectViewDelegate<NSObject>

- (void)onCloseSelectView;

@end

typedef void (^onLevelClickCallback)(URLevelType levelType, NSUInteger level);

@interface URLevelSelectView : UIView

@property (nonatomic, weak) id<URLevelSelectViewDelegate> delegate;

@property (nonatomic, assign) NSUInteger level;

@property (nonatomic, copy) onLevelClickCallback levelClickback;

@end
