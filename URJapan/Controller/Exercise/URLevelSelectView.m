//
//  URLevelSelectView.m
//  URJapan
//
//  Created by lin weiyan on 05/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URLevelSelectView.h"
#import "Masonry/Masonry.h"
#import "URMarco.h"

@interface URLevelSelectView()

@property (nonatomic, strong) UIButton  *learnBtn;
@property (nonatomic, strong) UIButton  *testBtn;

@end

@implementation URLevelSelectView

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
        [self initViews];
    }
    return self;
}

- (void)initViews
{
    self.learnBtn = [[UIButton alloc] init];
    self.learnBtn.backgroundColor = [UIColor redColor];
    [self.learnBtn addTarget:self action:@selector(onLearnClicked)
            forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.learnBtn];
    [self.learnBtn setTitle:@"学习" forState:UIControlStateNormal];
    
    [self.learnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(5);
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(70, 40));
    }];
    
    self.testBtn = [[UIButton alloc] init];
    self.testBtn.backgroundColor = [UIColor redColor];
    [self.testBtn addTarget:self action:@selector(onTestClicked)
            forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.testBtn];
    [self.testBtn setTitle:@"测试" forState:UIControlStateNormal];
    
    [self.testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).mas_offset(-5);
        make.size.mas_equalTo(CGSizeMake(70, 40));
        make.centerY.mas_equalTo(self);
    }];
}

- (void)onLearnClicked
{
    SafetyCallblock(self.levelClickback, URLevelType_Learn, self.level);
}

- (void)onTestClicked
{
    SafetyCallblock(self.levelClickback, URLevelType_Test, self.level);
}

@end
