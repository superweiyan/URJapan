//
//  URPhonogramModel.m
//  URJapan
//
//  Created by lin weiyan on 11/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URPhonogramModel.h"
#import "NSDictionary+URUtil.h"

@implementation URPhonogramModel

//+ (URPhonogramModel *)converFromJson:(NSDictionary *)json
//{
//    URPhonogramModel *model = [[URPhonogramModel alloc] init];
//    model.phonogram = [json getStringForKey:@""];
//    model.
//}

+ (URPhonogramModel *)converFromArray:(NSArray *) array
{
    URPhonogramModel *model = [[URPhonogramModel alloc] init];
    model.phonogram = [array objectAtIndex:0];
    model.kata = [array objectAtIndex:1];
    model.Hiragana = [array objectAtIndex:2];
    
    return model;
}

@end
