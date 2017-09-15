//
//  URSplashView.m
//  URJapan
//
//  Created by linweiyan on 2017/9/16.
//  Copyright © 2017年 URWY. All rights reserved.
//

#import "URSplashView.h"

@interface URSplashView()
{
    UIImageView     *_backImageView;
    UIButton        *_countDownBtn;
}
@end

@implementation URSplashView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _backImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_backImageView];
        
        _countDownBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width - 40 - 30, 30, 40, 40)];
        _countDownBtn.backgroundColor = [UIColor yellowColor];
        [self addSubview:_countDownBtn];
    }
    return self;
}

@end
