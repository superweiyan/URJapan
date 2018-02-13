//
//  URPhonogramTestService.m
//  URJapan
//
//  Created by lin weiyan on 12/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URPhonogramTestService.h"
#import "URPhonogramService.h"
#import "URService.h"
#import "URLearnPhonogramModel.h"

@interface URPhonogramTestService()

@end

@implementation URPhonogramTestService

- (NSArray *)getTestQuestion:(NSArray *)itemArray
{
    NSMutableArray *questionArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < (itemArray.count * 2); i++) {
        NSArray *randomKeys = [self getRandonQuestionKeyItemArray:itemArray.count];
        URPhonoQuestionModel *model = [self generateQuestion:randomKeys itemArray:itemArray];
        [questionArray addObject:model];
    }
    
    return questionArray;
}

- (NSArray *)getRandonQuestionKeyItemArray:(NSUInteger)count
{
    int x =  arc4random() % count;
    
    NSMutableArray * array = [[NSMutableArray alloc] init];
    [array addObject:(@(x))];
    
    NSMutableSet *itemSet = [[NSMutableSet alloc] init];
    
    for (int i = 0; i < (count * 3); i++) {
        int y =  arc4random() % count;
        [itemSet addObject:@(y)];
        
        if (itemSet.count >= 3) {
            break;
        }
    }
    
    NSEnumerator *enumerator = [itemSet objectEnumerator];
    for (NSObject *object in enumerator) {
        [array addObject:object];
    }
    return array;
}

- (URPhonoQuestionModel *)generateQuestion:(NSArray *)keyArray itemArray:(NSArray *)itemArray
{
    URPhonoQuestionModel * model = [[URPhonoQuestionModel alloc] init];
    model.isAudioTest = [self isAudioTest];
    
    NSMutableArray *choiceArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < keyArray.count; i++) {
        NSNumber *val = [keyArray objectAtIndex:i];
        NSString *key = [itemArray objectAtIndex:val.integerValue];
        
        URPhonogramModel * phonogramModel = [[URService shareObbject].phonogramService getPhonogramInfo:key];
        
        model.questionString = phonogramModel.phonogram;
        [choiceArray addObject:phonogramModel.kata];
    }
    
    model.choiceArray = choiceArray;
    model.rightAnswerIndex = 0;

    return model;
}

- (BOOL)isAudioTest
{
    return arc4random() % 5 == 0;
}

@end
