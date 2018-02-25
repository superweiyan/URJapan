//
//  URTestResultView.m
//  URJapan
//
//  Created by lin weiyan on 25/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URTestResultView.h"
#import "Masonry/Masonry.h"

@interface URTestResultView()

//@property (nonatomic, strong) UIImageView * resultImageView;
@property (nonatomic, strong) UILabel       *resultLabel;
@property (nonatomic, strong) UILabel       *resultInfoLable;
@property (nonatomic, strong) UIButton      *closeBtn;
@end

@implementation URTestResultView

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
        self.backgroundColor = [UIColor whiteColor];
        [self initViews];
    }
    return self;
}

- (void)updateInfo:(BOOL)result all:(NSUInteger)all  wrong:(NSUInteger)wrong
{
    NSString *imageName = result == TRUE ? @"恭喜通关" : @"通关失败，\n再试一次吧";
//    self.resultImageView.image = [UIImage imageNamed:imageName];
    self.resultLabel.text = imageName;
    
    NSString *info = [NSString stringWithFormat:@"错误题目数:%ld", wrong];
    self.resultInfoLable.text = info;
}

#pragma mark - action

- (void)onCloseClicked:(id)sender
{
    [self removeFromSuperview];
}

#pragma mark - init

- (void)initViews
{
    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.resultLabel.numberOfLines = 0;
    self.resultLabel.font = [UIFont systemFontOfSize:20];
    self.resultLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.resultLabel];
    
    [self.resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(150, 50));
    }];
    
    self.resultInfoLable = [[UILabel alloc] initWithFrame:CGRectZero];
    self.resultInfoLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.resultInfoLable];
    
    [self.resultInfoLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.resultLabel.mas_bottom).mas_offset(10);
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self).mas_offset(-20);
    }];
    
    self.closeBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [self addSubview:self.closeBtn];
    
    [self.closeBtn addTarget:self action:@selector(onCloseClicked:)
            forControlEvents:UIControlEventTouchUpInside];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.resultInfoLable.mas_bottom);
        make.left.right.bottom.mas_equalTo(self);
    }];
}

@end
