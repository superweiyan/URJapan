//
//  URTestResultView.h
//  URJapan
//
//  Created by lin weiyan on 25/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface URTestResultView : UIView

- (void)updateInfo:(BOOL)result all:(NSUInteger)all  wrong:(NSUInteger)wrong;

@end
