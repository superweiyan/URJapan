//
//  URService.h
//  URJapan
//
//  Created by lin weiyan on 12/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "URPhonogramService.h"

@interface URService : NSObject

+ (URService *)shareObbject;

@property (nonatomic, strong) URPhonogramService * phonogramService;

@end
