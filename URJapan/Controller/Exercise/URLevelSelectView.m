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
@property (nonatomic, strong) UIButton  *faultWordBtn;

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
    self.learnBtn.titleLabel.font = [UIFont systemFontOfSize:URDefaultFont];
    [self addSubview:self.learnBtn];
    [self.learnBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.learnBtn setTitle:@"学习" forState:UIControlStateNormal];
        
    self.testBtn = [[UIButton alloc] init];
    self.testBtn.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    [self.testBtn addTarget:self action:@selector(onTestClicked)
            forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.testBtn];
    self.testBtn.titleLabel.font = [UIFont systemFontOfSize:URDefaultFont];
    [self.testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.testBtn setTitle:@"测试" forState:UIControlStateNormal];
    
    self.faultWordBtn = [[UIButton alloc] init];
    self.faultWordBtn.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    [self.faultWordBtn addTarget:self action:@selector(onFaultWordClicked)
           forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.faultWordBtn];
    self.faultWordBtn.titleLabel.font = [UIFont systemFontOfSize:URDefaultFont];
    [self.faultWordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.faultWordBtn setTitle:@"错词本" forState:UIControlStateNormal];
    
    NSArray *items = @[self.learnBtn, self.testBtn, self.faultWordBtn];
//    [items mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedItemLength:30 leadSpacing:padding2 tailSpacing:padding2];
    [items mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:10 leadSpacing:10 tailSpacing:10];
    [items mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(120);
        make.centerX.mas_equalTo(self);
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

- (void)onFaultWordClicked
{
    SafetyCallblock(self.levelClickback, URLevelType_FaultWord, self.level);
}

- (void)onTapGesture:(UIGestureRecognizer *)gesture
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(onCloseSelectView)]){
        [self.delegate onCloseSelectView];
    }
}

@end
