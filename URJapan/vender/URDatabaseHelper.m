//
//  URDatabaseHelper.m
//  URJapan
//
//  Created by lin weiyan on 06/03/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URDatabaseHelper.h"
#import "FMDB.h"
#import "URPathUtils.h"

@interface URDatabaseHelper()

@property (nonatomic, strong) FMDatabase *db;

@end

@implementation URDatabaseHelper

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)initWithDatabase:(NSUInteger)uid
{
    NSString *dbPath = [[URPathUtils getDocumentDir] stringByAppendingPathComponent:@"uid.db"];
    self.db = [FMDatabase databaseWithPath:dbPath];
}

- (void)createDBTable:(NSString *)table
{
    
}
@end
