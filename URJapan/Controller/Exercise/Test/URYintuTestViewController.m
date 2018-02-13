//
//  URYintuTestViewController.m
//  URJapan
//
//  Created by lin weiyan on 05/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URYintuTestViewController.h"
#import "URMarco.h"
#import "URPhonogramLevelService.h"
#import "Masonry/Masonry.h"
#import "URLearnPhonogramModel.h"
#import "URService.h"
#import "URPhonogramQuestionCollectionViewCell.h"

@interface URYintuTestViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UILabel                           *questionLabel;
@property (nonatomic, strong) UICollectionView                  *itemCollectView;

@property (nonatomic, strong) NSArray<URPhonoQuestionModel *>   *questionArray;
@property (nonatomic, strong) URPhonoQuestionModel              *currentQuestionModel;
@property (nonatomic, assign) NSInteger                         answerSelectIndex;

@end

@implementation URYintuTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DefaultBGColor()
    
    self.navigationItem.title = [NSString stringWithFormat:@"第%ld关", (self.level+1)];
    
    [self initViews];
    [self loadData];
}

- (void)dealloc
{
    self.itemCollectView.delegate = nil;
    self.itemCollectView.dataSource = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init

- (void)initViews
{
    self.questionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.questionLabel.backgroundColor = [UIColor redColor];
    self.questionLabel.font = [UIFont systemFontOfSize:36];
    self.questionLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.questionLabel];
    
    [self.questionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 60));
        make.top.mas_equalTo(150);
        make.centerX.mas_equalTo(self.view);
    }];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 20;
    layout.minimumLineSpacing = 20;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.itemSize = CGSizeMake(100, 100);
    
    self.itemCollectView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.itemCollectView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.itemCollectView];
    self.itemCollectView.delegate = self;
    self.itemCollectView.dataSource = self;
    [self.itemCollectView registerClass:[URPhonogramQuestionCollectionViewCell class]
             forCellWithReuseIdentifier:@"cellIntiefer"];
    
    [self.itemCollectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.questionLabel.mas_bottom).mas_offset(15);
        make.size.mas_equalTo(CGSizeMake(240, 240));
        make.centerX.mas_equalTo(self.view);
    }];
}

- (void)loadData
{
    self.answerSelectIndex = -1;
    self.questionArray = [[URService shareObbject].phonoGramlevalService getQuestionArray:self.level];
    
    self.currentQuestionModel = [self.questionArray firstObject];
    self.questionLabel.text = self.currentQuestionModel.questionString;
}

#pragma mark - uicollectDatasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.currentQuestionModel.choiceArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    URPhonogramQuestionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIntiefer" forIndexPath:indexPath];
    
    if (indexPath.row < self.currentQuestionModel.choiceArray.count) {
        NSString *word = [self.currentQuestionModel.choiceArray objectAtIndex:indexPath.row];
        cell.word = word;
        cell.tag = indexPath.row;
        [cell updateAnswer:self.answerSelectIndex rightAnswer:self.currentQuestionModel.rightAnswerIndex];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.answerSelectIndex >= 0) {
        return ;
    }
    
    self.answerSelectIndex = indexPath.row;
    [self.itemCollectView reloadData];
}

- (int)checkAnswer:(NSInteger)rightIndex
{
    if (rightIndex == self.answerSelectIndex) {
        return 1;
    }
    else if (rightIndex != self.answerSelectIndex) {
        return -1;
    }
    return 0;
}

@end
