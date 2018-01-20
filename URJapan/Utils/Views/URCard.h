//
//  URCard.h
//  URJapan
//
//  Created by lin weiyan on 20/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef (^onURCardClicked) (NSString *);

@interface URCard : UIView

@property (nonatomic, copy) onURCardClicked callback;

- (void)updateInfo:(UIImage *)image title:(NSString *)title;

@end
