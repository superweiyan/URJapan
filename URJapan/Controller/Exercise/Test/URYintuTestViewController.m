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
#import "URToast.h"
#import "URTestResultView.h"
#import "URPhonogramLevelService.h"
#import "URRecordService.h"

@interface URYintuTestViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UILabel                           *allQuestionCountLabel;
@property (nonatomic, strong) UILabel                           *questionLabel;
@property (nonatomic, strong) UICollectionView                  *itemCollectView;

@property (nonatomic, strong) NSArray<URPhonoQuestionModel *>   *questionArray;
@property (nonatomic, strong) URPhonoQuestionModel              *currentQuestionModel;
@property (nonatomic, assign) NSInteger                         answerSelectIndex;
@property (nonatomic, assign) NSUInteger                        currentQuestionIndex;
@property (nonatomic, strong) UIButton                          *nextQuestionBtn;
@property (nonatomic, strong) NSMutableArray                    *wrongQuestionArray;
@property (nonatomic, assign) BOOL                              hadAnswerQuestion;

@end

@implementation URYintuTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DefaultBGColor()
    
    self.navigationItem.title = [NSString stringWithFormat:@"第%ld关", (self.level+1)];
    
    [self initViews];
    [self loadData];
    [self reloadQuestion:self.currentQuestionIndex];
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

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void)loadData
{
    self.answerSelectIndex = -1;
    self.currentQuestionIndex = 0;
    self.wrongQuestionArray = [[NSMutableArray alloc] init];
    self.questionArray = [[URService shareObbject].phonoGramlevalService getQuestionArray:self.level];
}

- (void)reloadQuestion:(NSUInteger)questionIndex
{
    self.currentQuestionModel = [self.questionArray objectAtIndex:questionIndex];
    self.questionLabel.text = self.currentQuestionModel.questionString;
    
    self.allQuestionCountLabel.text = [NSString stringWithFormat:@"当前完成情况%ld / %ld",
                                       questionIndex+1, self.questionArray.count];
    self.answerSelectIndex = -1;
    [self.itemCollectView reloadData];
}

#pragma mark - uicollectDatasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.currentQuestionModel.choiceArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath
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
    
    if (self.hadAnswerQuestion) {
        return;
    }
    
    self.hadAnswerQuestion = YES;
    
    self.answerSelectIndex = indexPath.row;
    
    if(self.currentQuestionModel.rightAnswerIndex != self.answerSelectIndex) {
        [self.wrongQuestionArray addObject:@(self.currentQuestionIndex)];
    }
    [self.itemCollectView reloadData];
    
    if (self.currentQuestionIndex == (self.questionArray.count - 1)) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self showResultView];
        });
    }
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

#pragma mark - action

- (void)onNextQuestionClicked:(id)sender
{
    if (self.answerSelectIndex < 0) {
        [URToast showTitle:@"还没有回答"];
        return ;
    }
    
    self.hadAnswerQuestion = NO;
    
    self.currentQuestionIndex += 1;
    if (self.currentQuestionIndex >= self.questionArray.count) {
        [URToast showTitle:@"最后一题"];
        return ;
    }
    
    if (self.currentQuestionIndex == (self.questionArray.count-1)) {
        [self.nextQuestionBtn setTitle:@"最后一题" forState:UIControlStateNormal];
    }
    
    [self reloadQuestion:self.currentQuestionIndex];
}

#pragma mark - helper

- (void)showResultView
{
    URTestResultView *aView = [[URTestResultView alloc] initWithFrame:CGRectZero];
    aView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:aView];
    
    [aView updateInfo:(self.wrongQuestionArray.count < 2)
                  all:self.questionArray.count
                wrong:self.wrongQuestionArray.count];
    
    [aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 250));
    }];
    
    if (self.wrongQuestionArray.count < 2) {
        [[URService shareObbject].recordService markPastLevel:self.level type:@"yuyin"];
    }
}

#pragma mark - init

- (void)initViews
{
    self.questionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
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
    
    self.allQuestionCountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.allQuestionCountLabel];
    self.allQuestionCountLabel.font = [UIFont systemFontOfSize:18];
    self.allQuestionCountLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.allQuestionCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.itemCollectView.mas_bottom).mas_offset(10);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 30));
    }];
    
    self.nextQuestionBtn = [[UIButton alloc] init];
    [self.nextQuestionBtn setTitle:@"下一题" forState:UIControlStateNormal];
    [self.nextQuestionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.nextQuestionBtn];
    [self.nextQuestionBtn addTarget:self action:@selector(onNextQuestionClicked:)
                   forControlEvents:UIControlEventTouchUpInside];
    
    [self.nextQuestionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.allQuestionCountLabel.mas_bottom).mas_offset(15);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
}

@end
