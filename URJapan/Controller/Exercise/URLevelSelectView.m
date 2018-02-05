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
@property (nonatomic, strong) UIButton  *studyBtn;

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
    
    [self.learnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(5);
        make.top.mas_equalTo(self).mas_offset(5);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
    
    self.studyBtn = [[UIButton alloc] init];
    self.studyBtn.backgroundColor = [UIColor redColor];
    [self.studyBtn addTarget:self action:@selector(onStudyClicked)
            forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.studyBtn];
    
    [self.studyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).mas_offset(5);
        make.top.mas_equalTo(self).mas_offset(5);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
}

- (void)onLearnClicked
{
    SafetyCallblock(self.levelClickback, URLevelType_Learn);
}

- (void)onStudyClicked
{
    SafetyCallblock(self.levelClickback, URLevelType_Test);
}

@end
