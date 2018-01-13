//
//  URConfigHelper.m
//  URJapan
//
//  Created by lin weiyan on 11/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URConfigHelper.h"

@implementation URConfigHelper

+ (NSDictionary *)getConfigFromName:(NSString *)configName
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *strPath = [bundle pathForResource:configName ofType:nil];
    NSError *error;
    NSString *parseJason = [[NSString alloc] initWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"parseJason error : %@", error.localizedDescription);
        return nil;
    }
    
    NSData *data = [parseJason dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *serialization = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if (error) {
        NSLog(@"serialization error : %@", error.localizedDescription);
        return nil;
    }
    return serialization;
}

@end
