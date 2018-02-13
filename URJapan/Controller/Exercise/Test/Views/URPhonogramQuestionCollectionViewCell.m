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

@property (nonatomic, strong) UILabel               *label;
@property (nonatomic, strong) UIImageView           *answerStatusImageView;
@property (nonatomic, assign) NSInteger             answerIndex;
@property (nonatomic, assign) NSInteger             selectAnswerIndex;

@end

@implementation URPhonogramQuestionCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:self.label];
        self.label.font = [UIFont systemFontOfSize:28];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.backgroundColor = [UIColor redColor];
        
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        
        self.answerStatusImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.answerStatusImageView.hidden = YES;
        [self addSubview:self.answerStatusImageView];
        
        [self.answerStatusImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self);
            make.left.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
    }
    return self;
}

- (void)setWord:(NSString *)word
{
    _word = word;
    self.label.text = word;
}

- (void)updateAnswer:(NSInteger)selectAnswerIndex rightAnswer:(NSInteger)rightAnswerIndex;
{
    self.selectAnswerIndex = selectAnswerIndex;
    self.answerIndex = rightAnswerIndex;
    
    if (self.tag == self.selectAnswerIndex) {
        self.answerStatusImageView.hidden = NO;
        if (self.tag == self.answerIndex) {
            self.answerStatusImageView.image = [UIImage imageNamed:@"yes"];
        }
        else {
            self.answerStatusImageView.image = [UIImage imageNamed:@"error"];
        }
    }
    else if(self.selectAnswerIndex > 0 && self.tag == self.answerIndex){
        self.answerStatusImageView.hidden = NO;
        self.answerStatusImageView.image = [UIImage imageNamed:@"yes"];
    }
    else {
        self.answerStatusImageView.hidden = YES;
    }
}

@end
