//
//  URMarco.h
//  URJapan
//
//  Created by lin weiyan on 18/12/2017.
//  Copyright © 2017 URWY. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - viewcontroller

#define NewController(name)  [[NSClassFromString(name) alloc] init]
#define DefaultBGColor()  self.view.backgroundColor = [UIColor whiteColor];

#pragma mark - UIColor

#define URWhiteColor  [UIColor whiteColor]


#pragma mark - log

#define FunctionName()  NSLog(@"%s", __FUNCTION__);
