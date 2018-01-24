//
//  URCard.m
//  URJapan
//
//  Created by lin weiyan on 20/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URCard.h"
#import "Masonry.h"
#import "URLessionModel.h"

@interface URCard()

@property (nonatomic, strong) UIImageView   *logoImage;
@property (nonatomic, strong) UILabel       *tipLabel;
@property (nonatomic, strong) UIButton      *maskBtn;
@property (nonatomic, strong) NSString      *title;

@end

@implementation URCard

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
    self.logoImage = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:self.logoImage];
    
    [self.logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.height.mas_equalTo(100);
    }];
    
    self.tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.tipLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.tipLabel];
    
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.logoImage.mas_bottom);
        make.left.mas_equalTo(self.logoImage.mas_left);
        make.right.mas_equalTo(self.logoImage.mas_right);
        make.bottom.mas_equalTo(self);
    }];
    
    self.maskBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.maskBtn addTarget:self action:@selector(onClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.maskBtn];
    
    [self.maskBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

- (void)updateData:(URLessionModel *)model
{
    self.title = model.lessionName;
    NSString *imageName = [[NSBundle mainBundle] pathForResource:model.iconName ofType:nil];
    self.logoImage.image = [UIImage imageWithContentsOfFile:imageName];
    self.tipLabel.text = model.lessionName;
}

- (void)onClicked:(id)sender
{
    if (self.callback) {
        self.callback(self.tag);
    }
}

@end
