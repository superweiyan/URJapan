//
//  URService.h
//  URJapan
//
//  Created by lin weiyan on 12/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "URPhonogramService.h"
#import "URPhonogramLearnService.h"

//@class URPhonogramTestService;
@class URPhonogramLevelService;
@class URRecordService;

@interface URService : NSObject

+ (URService *)shareObbject;

@property (nonatomic, strong) URPhonogramService            * phonogramService;
//@property (nonatomic, strong) URPhonogramLearnService       * phonogramLearnService;
//@property (nonatomic, strong) URPhonogramTestService        * phonoGramTestService;
@property (nonatomic, strong) URPhonogramLevelService       * phonoGramlevalService;
@property (nonatomic, strong) URRecordService               * recordService;

@end
