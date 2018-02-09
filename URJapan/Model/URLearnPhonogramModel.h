//
//  URLearnPhonogramModel.h
//  URJapan
//
//  Created by lin weiyan on 09/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URPhonogramModel.h"

@interface URLearnPhonogramModel : NSObject

@property (nonatomic, strong) URPhonogramModel  *phonogramModel;
@property (nonatomic, strong) NSArray           *exampleArray;

@end
