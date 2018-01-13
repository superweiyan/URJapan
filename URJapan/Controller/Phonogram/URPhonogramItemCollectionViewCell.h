//
//  URPhonogramItemCollectionViewCell.h
//  URJapan
//
//  Created by lin weiyan on 12/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class URPhonogramModel;

typedef NS_ENUM(NSUInteger, URShowMode) {
    URShowMode_Kata = 0,
    URShowMode_Hiragana = 1
};

@interface URPhonogramItemCollectionViewCell : UICollectionViewCell

@property (nonatomic, assign) CGPoint       touchPoint;

- (void)updateData:(URPhonogramModel *)model showMode:(URShowMode)mode;

@end
