//
//  URTTSTestView.m
//  URJapan
//
//  Created by lin weiyan on 11/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URTTSTestView.h"
#import "Masonry.h"
#import "URTTSHelper.h"

@interface URTTSTestView()

@property (nonatomic, strong) UITextField   *textField;
@property (nonatomic, strong) UIButton      *playBtn;
@property (nonatomic, strong) URTTSHelper   *ttsHelper;
@property (nonatomic, strong) UIButton      *closeBtn;

@end

@implementation URTTSTestView

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
    self.textField = [[UITextField alloc] init];
    [self addSubview:self.textField];
    self.textField.layer.borderColor = [UIColor redColor].CGColor;
    self.textField.layer.borderWidth = 2;
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(300);
        make.left.mas_equalTo(self).mas_offset(50);
        make.right.mas_equalTo(self).mas_offset(-60);
        make.height.mas_equalTo(40);
    }];
    
    self.playBtn  = [[UIButton alloc] init];
    [self.playBtn addTarget:self action:@selector(onPlayBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.playBtn setTitle:@"播放" forState:UIControlStateNormal];
    self.playBtn.backgroundColor = [UIColor redColor];
    [self addSubview:self.playBtn];
    
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.textField.mas_bottom).mas_offset(50);
        make.centerX.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    self.closeBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    self.closeBtn.backgroundColor = [UIColor blueColor];
    [self.closeBtn addTarget:self action:@selector(onCloseBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.closeBtn];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.playBtn.mas_bottom).mas_offset(100);
        make.centerX.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
}

- (URTTSHelper *)ttsHelper
{
    if (!_ttsHelper) {
        _ttsHelper = [[URTTSHelper alloc] init];
        _ttsHelper.rate = 0.3;
        _ttsHelper.volume = 1.0;
    }
    return _ttsHelper;
}

- (void)onPlayBtn
{
    NSString *text = self.textField.text;
    self.ttsHelper.language = @"ja-JP";
    [self.ttsHelper playText:text];
}

- (void)onCloseBtn
{
    [self removeFromSuperview];
}

@end
