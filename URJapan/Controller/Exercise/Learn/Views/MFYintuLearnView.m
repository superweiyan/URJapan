//
//  MFYintuLearnView.m
//  URJapan
//
//  Created by lin weiyan on 08/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "MFYintuLearnView.h"
#import "Masonry/Masonry.h"

@interface MFYintuLearnView()

@property (nonatomic, strong) UILabel       *phonogramLabel;
@property (nonatomic, strong) UILabel       *wordLabel;
@property (nonatomic, strong) UIButton      *changeBtn;
@property (nonatomic, strong) UITextView    *textView;

@end

@implementation MFYintuLearnView

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
    self.phonogramLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.phonogramLabel.backgroundColor = [UIColor yellowColor];
    self.phonogramLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.phonogramLabel];
    
    [self.phonogramLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(15);
        make.top.mas_equalTo(self).mas_offset(15);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    self.wordLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.wordLabel.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.wordLabel];
    
    [self.wordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phonogramLabel.mas_bottom).mas_offset(15);
        make.left.mas_equalTo(self).mas_offset(15);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    self.changeBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.changeBtn setTitle:@"切换片/平假名" forState:UIControlStateNormal];
    self.changeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.changeBtn addTarget:self action:@selector(onChangeClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.changeBtn];
    
    [self.changeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.wordLabel.mas_right).mas_offset(15);
        make.centerY.mas_equalTo(self.wordLabel.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    tipLabel.text = @"例句";
    [self addSubview:tipLabel];
    
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.wordLabel.mas_bottom).mas_offset(15);
        make.left.mas_equalTo(self).mas_offset(15);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectZero];
    self.textView.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(15);
        make.top.mas_equalTo(tipLabel.mas_bottom).mas_offset(15);
        make.right.mas_equalTo(self).mas_offset(-15);
        make.bottom.mas_equalTo(self).mas_offset(-15);
    }];
}

#pragma mark - action

- (void)onChangeClicked:(id)sender
{
    
}

@end
