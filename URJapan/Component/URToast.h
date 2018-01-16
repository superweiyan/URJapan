//
//  URToast.h
//  URJapan
//
//  Created by lin weiyan on 15/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface URToast : UIView

@property (nonatomic, strong) UILabel *titleLabel;

+ (void)showTitle:(NSString *)title;

@end
