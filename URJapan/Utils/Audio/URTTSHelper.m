//
//  URTTSHelper.m
//  URJapan
//
//  Created by lin weiyan on 11/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URTTSHelper.h"
#import <AVFoundation/AVFoundation.h>

@interface URTTSHelper()

@property (nonatomic, strong) AVSpeechSynthesizer  *speechSynthesizer;

@end

@implementation URTTSHelper

- (id)init
{
    self = [super init];
    if (self) {
        self.rate = 0.4;
        self.volume = 0.5;
        self.language = @"zh_CN";
    }
    return self;
}

- (void)playText:(NSString *)text
{
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:text];
    utterance.rate = self.rate;
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:self.language];
    utterance.volume = self.volume;
    [self.speechSynthesizer speakUtterance:utterance];
}

- (AVSpeechSynthesizer *)speechSynthesizer
{
    if (!_speechSynthesizer) {
        _speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
    }
    return _speechSynthesizer;
}

@end
