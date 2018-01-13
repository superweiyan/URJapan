//
//  URAudioPlayer.m
//  URJapan
//
//  Created by lin weiyan on 13/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URAudioPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface URAudioPlayer()

@property (nonatomic, strong) AVPlayer  *player;

@end

@implementation URAudioPlayer

- (void)playAudioFromPath:(NSString *)path
{
    #warning 判断路径是否有效，如果无效，写log并且提示
    if (path.length == 0) {
        return ;
    }

    NSURL *url = [[NSURL alloc] initFileURLWithPath: path];
    AVAsset *asset = [AVURLAsset URLAssetWithURL:url options:nil];
    AVPlayerItem *anItem = [AVPlayerItem playerItemWithAsset:asset];
    [self.player replaceCurrentItemWithPlayerItem:anItem];
    [self.player play];
}

- (AVPlayer *)player
{
    if (!_player) {
        _player = [[AVPlayer alloc] init];
    }
    return _player;
}

@end
