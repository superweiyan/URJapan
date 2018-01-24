//
//  URCard.h
//  URJapan
//
//  Created by lin weiyan on 20/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class URLessionModel;

typedef void (^onURCardClicked) (NSUInteger);

@interface URCard : UIView

- (void)updateData:(URLessionModel *)model;

@property (nonatomic, copy) onURCardClicked callback;



@end
