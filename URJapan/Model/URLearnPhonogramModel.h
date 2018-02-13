//
//  URLearnPhonogramModel.h
//  URJapan
//
//  Created by lin weiyan on 09/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URPhonogramModel.h"


@interface URPhonogramExampleModel : NSObject

@property (nonatomic, strong) NSString *phonogram;
@property (nonatomic, strong) NSString *chinaDesc;

@end

@interface URLearnPhonogramModel : NSObject

@property (nonatomic, strong) URPhonogramModel                              *phonogramModel;
@property (nonatomic, strong) NSArray<URPhonogramExampleModel *>            *exampleArray;

@end

@interface URPhonoQuestionModel : NSObject

@property (nonatomic, strong) NSString      *questionString;
@property (nonatomic, strong) NSArray       *choiceArray;
@property (nonatomic, assign) NSUInteger    rightAnswerIndex;
@property (nonatomic, assign) BOOL          isAudioTest;

@end

