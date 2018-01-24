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

#define URWhiteColor()  [UIColor whiteColor]


#pragma mark - log

#define FunctionName()  NSLog(@"%s", __FUNCTION__);

#pragma mark - callback

#define WeakSelf()  __weak __typeof__(self) weakSelf = self;
#define SafetyCallblock(block, ...) if((block)) { block(__VA_ARGS__); }

#pragma mark - init

#define URStrongPropert @property (nonatomic, strong)

#pragma mark - rect

#define URScreenWidth() [UIScreen mainScreen].bounds.size.width
#define URScreenHeight() [UIScreen mainScreen].bounds.size.height

#pragma mark - path

#define ResourcePath(name) [[NSBundle mainBundle] pathForResource:name ofType:nil]
