//
//  URPhonogramViewController.m
//  URJapan
//
//  Created by lin weiyan on 18/12/2017.
//  Copyright © 2017 URWY. All rights reserved.
//

#import "URPhonogramViewController.h"
#import "URMarco.h"
#import "URService.h"
#import "URPhonogramModel.h"
#import "Masonry.h"
#import "URSystemUtils.h"
#import "URPhonogramItemCollectionViewCell.h"
#import "URAudioPlayer.h"

@interface URPhonogramViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    NSArray           *_phonogramArray;
    
    UICollectionView  *_phonogramCollect;
}

@property (nonatomic, strong) URAudioPlayer     *audioPlayer;
@end

@implementation URPhonogramViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DefaultBGColor()
    // Do any additional setup after loading the view.
    
    [self loadData];
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)initViews
{
    UICollectionViewFlowLayout *collectionLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionLayout.itemSize = CGSizeMake(60, 70);
    collectionLayout.minimumLineSpacing = 10;
    collectionLayout.minimumInteritemSpacing = [self miniInteritemSpacing];
    collectionLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    _phonogramCollect = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:collectionLayout];
    [_phonogramCollect registerClass:[URPhonogramItemCollectionViewCell class] forCellWithReuseIdentifier:@"defaultCell"];
    _phonogramCollect.backgroundColor = URWhiteColor();
    _phonogramCollect.delegate = self;
    _phonogramCollect.dataSource = self;
    [self.view addSubview:_phonogramCollect];

    [_phonogramCollect mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (URAudioPlayer *)audioPlayer
{
    if (!_audioPlayer) {
        _audioPlayer = [[URAudioPlayer alloc] init];
    }
    return _audioPlayer;
}

- (void)loadData
{
    _phonogramArray = [URService shareObbject].phonogramService.phonogramArray;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _phonogramArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    URPhonogramItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"defaultCell" forIndexPath:indexPath];
    
    if (indexPath.row < _phonogramArray.count) {
        URPhonogramModel *model = [_phonogramArray objectAtIndex:indexPath.row];
        [cell updateData:model showMode:URShowMode_Kata];
        WeakSelf();
        cell.playCallback = ^(NSString * audioKey) {
            [weakSelf playAudio:audioKey];
        };
    }
    return cell;
}

//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    URPhonogramItemCollectionViewCell * cell = [collectionView cellForItemAtIndexPath:indexPath];
//    NSLog(@"touch location %f, %f", cell.touchPoint.x, cell.touchPoint.y);
//}

#pragma mark - helper

- (CGFloat)miniInteritemSpacing
{
    if([URSystemUtils getiPhoneSize].width == 320)
    {
        return 5;
    }
    else if ([URSystemUtils getiPhoneSize].width == 375) {
        return 10;
    }
    else if ([URSystemUtils getiPhoneSize].width == 414) {
        return 15;
    }
    return 0;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(60, 60);
//}

#pragma mark - helper

- (void)playAudio:(NSString *)audioKey
{
    NSString *audioFile = [NSString stringWithFormat:@"%@.wav", audioKey];
     NSString *path = [[NSBundle mainBundle] pathForResource:audioFile ofType:nil];
    [self.audioPlayer playAudioFromPath:path];
}


@end
