//
//  URCard.m
//  URJapan
//
//  Created by lin weiyan on 20/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URCard.h"
#import "Masonry.h"

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
        make.height.mas_equalTo(MAX(self.bounds.size.width, self.bounds.size.height));
    }];
    
    self.tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
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

- (void)updateInfo:(UIImage *)image title:(NSString *)title
{
    self.title = title;
}

- (void)onClicked:(id)sender
{
    if (self.callback) {
        self.callback(self.title);
    }
}

@end
