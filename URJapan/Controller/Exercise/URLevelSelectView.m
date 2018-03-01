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
#import "URThemeConfig.h"

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
        [self initData];
        [self initViews];
    }
    return self;
}

- (void)initViews
{
    self.learnBtn = [[UIButton alloc] init];
    self.learnBtn.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    [self.learnBtn addTarget:self action:@selector(onLearnClicked)
            forControlEvents:UIControlEventTouchUpInside];
    self.learnBtn.titleLabel.font = [UIFont systemFontOfSize:URBigFont];
    [self addSubview:self.learnBtn];
    [self.learnBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.learnBtn setTitle:@"学习" forState:UIControlStateNormal];
    
    [self.learnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(5);
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(85, 40));
    }];
    
    self.testBtn = [[UIButton alloc] init];
    self.testBtn.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    [self.testBtn addTarget:self action:@selector(onTestClicked)
            forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.testBtn];
    self.testBtn.titleLabel.font = [UIFont systemFontOfSize:URBigFont];
    [self.testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.testBtn setTitle:@"测试" forState:UIControlStateNormal];
    
    [self.testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).mas_offset(-5);
        make.size.mas_equalTo(CGSizeMake(85, 40));
        make.centerY.mas_equalTo(self);
    }];
}

- (void)initData
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapGesture:)];
    [self addGestureRecognizer:tapGesture];
}

#pragma mark - action

- (void)onLearnClicked
{
    SafetyCallblock(self.levelClickback, URLevelType_Learn, self.level);
}

- (void)onTestClicked
{
    SafetyCallblock(self.levelClickback, URLevelType_Test, self.level);
}

- (void)onTapGesture:(UIGestureRecognizer *)gesture
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(onCloseSelectView)]){
        [self.delegate onCloseSelectView];
    }
}

@end
