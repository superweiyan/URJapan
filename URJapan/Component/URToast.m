//
//  URToast.m
//  URJapan
//
//  Created by lin weiyan on 15/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URToast.h"

@interface URToast()

@end

@implementation URToast

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        [self addSubview:self.titleLabel];
    }
    return self;
}

+ (void)showTitle:(NSString *)title
{
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - 100)/2;
    URToast *toast = [[URToast alloc] initWithFrame:CGRectMake(x, 500, 100, 30)];
    toast.titleLabel.text = title;
    [[UIApplication sharedApplication].keyWindow addSubview:toast];
    
    toast.alpha = 0.0;
    [UIView animateKeyframesWithDuration:4.0
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
                              animations:^{
                                  [UIView addKeyframeWithRelativeStartTime:0.0
                                                          relativeDuration:1/4.0
                                                                animations:^{
                                                                    toast.transform = CGAffineTransformMakeTranslation(0, -20);
                                                                    toast.alpha = 1.0;
                                                                }];
                                  [UIView addKeyframeWithRelativeStartTime:3/4.0
                                                          relativeDuration:1/4.0
                                                                animations:^{
                                                                    toast.transform = CGAffineTransformMakeTranslation(0, 20);
                                                                    toast.alpha = 0.0;
                                                                }];
                              }
                              completion:^(BOOL finished) {
                                  [toast removeFromSuperview];
                              }];
}



@end
