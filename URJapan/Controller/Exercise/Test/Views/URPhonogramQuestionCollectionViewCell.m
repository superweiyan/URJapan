//
//  URPhonogramQuestionCollectionViewCell.m
//  URJapan
//
//  Created by lin weiyan on 13/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URPhonogramQuestionCollectionViewCell.h"
#import "Masonry/Masonry.h"

@interface URPhonogramQuestionCollectionViewCell()

@property (nonatomic, strong) UILabel   *label;

@end

@implementation URPhonogramQuestionCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:self.label];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.backgroundColor = [UIColor redColor];
        
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
    }
    return self;
}

- (void)setWord:(NSString *)word
{
    _word = word;
    self.label.text = word;
}

@end
