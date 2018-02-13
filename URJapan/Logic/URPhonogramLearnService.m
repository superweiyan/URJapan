//
//  URPhonogramLearnService.m
//  URJapan
//
//  Created by lin weiyan on 09/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URPhonogramLearnService.h"
#import "URLearnPhonogramModel.h"
#import "URConfigHelper.h"
#import "URPhonogramService.h"
#import "URService.h"

@interface URPhonogramLearnService()

@end

@implementation URPhonogramLearnService

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (URLearnPhonogramModel *)getLearnPhonogramItemInfo:(NSString *)key
{
    URPhonogramModel * model = [[URService shareObbject].phonogramService getPhonogramInfo:key];
    NSArray *exampleModel = [self.exampleDict objectForKey:key];
    
    URLearnPhonogramModel *learnModel = [[URLearnPhonogramModel alloc] init];
    learnModel.phonogramModel = model;
    learnModel.exampleArray = exampleModel;
    return learnModel;
}

#pragma mark - load



#pragma mark - action



@end
