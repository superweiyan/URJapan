//
//  URPhonogramItemCollectionViewCell.m
//  URJapan
//
//  Created by lin weiyan on 12/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URPhonogramItemCollectionViewCell.h"
#import "Masonry.h"
#import "URPhonogramModel.h"
#import "URMarco.h"

@interface URPhonogramItemCollectionViewCell()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UILabel   *fayinLabel;
@property (nonatomic, strong) UILabel   *riyuLabel;

@property (nonatomic, assign) BOOL      hadLongGesture;

@property (nonatomic, strong) UILongPressGestureRecognizer *longRecognizer;
@property (nonatomic, strong) UITapGestureRecognizer        *tapGestureRecognizer;

@end

@implementation URPhonogramItemCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
        [self initGesture];
    }
    return self;
}

- (void)dealloc
{
}

- (void)initViews
{
    _fayinLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _fayinLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_fayinLabel];
    
    [_fayinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.bounds.size.height/2);
        make.width.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self);
    }];
    
    _riyuLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _riyuLabel.textAlignment = NSTextAlignmentCenter; 
    [self addSubview:_riyuLabel];
    
    [_riyuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.bounds.size.height/2);
        make.width.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self);
    }];
}

- (void)updateData:(URPhonogramModel *)model showMode:(URShowMode)mode
{
    if (mode == URShowMode_Kata) {
        self.riyuLabel.text = model.kata;
    }
    else {
        self.riyuLabel.text = model.Hiragana;
    }
 
    self.fayinLabel.text = model.phonogram;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    self.touchPoint = [[touches anyObject] locationInView:self];
}

- (void)initGesture
{
    self.longRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongRecognizer:)];
    self.longRecognizer.delegate = self;
    [self addGestureRecognizer:self.longRecognizer];
    
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapRecognizer:)];
    self.tapGestureRecognizer.delegate = self;
    [self.tapGestureRecognizer requireGestureRecognizerToFail:self.longRecognizer];
    [self addGestureRecognizer:self.tapGestureRecognizer];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.longRecognizer) {
        NSLog(@"begin long gesture");
        self.hadLongGesture = YES;
    }
    else if (gestureRecognizer == self.tapGestureRecognizer) {
        NSLog(@"begin tap gestur");
    }
    return YES;
}

- (void)onLongRecognizer:(UILongPressGestureRecognizer *)gesture
{
    if (!self.hadLongGesture) {
        return ;
    }
    self.hadLongGesture = NO;
}

- (void)onTapRecognizer:(UITapGestureRecognizer *)gesture
{
    FunctionName();
}

@end
