//
//  URSwitchCardView.h
//  URJapan
//
//  Created by lin weiyan on 20/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^onSwitchCardView)(NSUInteger index);

@interface URSwitchCardView : UIView

@property (nonatomic, copy) onSwitchCardView switchCardCallback;

- (void)updateData:(NSArray *)array;

@end
