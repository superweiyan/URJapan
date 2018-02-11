//
//  URYintuLearnViewController.m
//  URJapan
//
//  Created by lin weiyan on 05/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URYintuLearnViewController.h"
#import "URMarco.h"
#import "MFYintuLearnView.h"
#import "Masonry/Masonry.h"
#import "URLearnPhonogramModel.h"
#import "URService.h"
#import "URPhonogramLearnService.h"

@interface URYintuLearnViewController ()

@property (nonatomic, strong) UIButton              *nextBtn;
@property (nonatomic, strong) UIButton              *prevBtn;

@property (nonatomic, assign) NSUInteger            currentTag;
@property (nonatomic, strong) NSArray               *viewsArray;
@property (nonatomic, strong) NSMutableArray        *daraArray;
@property (nonatomic, assign) NSInteger             currentLearnIndex;

@end

@implementation URYintuLearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DefaultBGColor()
    
    [self initData];
    [self initViews];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init

- (void)initViews
{
    self.prevBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    self.prevBtn.backgroundColor = [UIColor redColor];
    [self.prevBtn setTitle:@"上一个" forState:UIControlStateNormal];
    [self.prevBtn addTarget:self
                     action:@selector(onPrevBtnClicked:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.prevBtn];
    
    [self.prevBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view).mas_offset(-80);
        make.left.mas_equalTo(self.view).mas_offset(100);
        make.size.mas_equalTo(CGSizeMake(60, 40));
    }];

    self.nextBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    self.nextBtn.backgroundColor = [UIColor redColor];
    [self.nextBtn setTitle:@"下一个" forState:UIControlStateNormal];
    [self.nextBtn addTarget:self
                     action:@selector(onNextBtcClicked:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextBtn];
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view).mas_offset(-80);
        make.left.mas_equalTo(self.prevBtn.mas_right).mas_offset(15);
        make.size.mas_equalTo(CGSizeMake(60, 40));
    }];
    
    MFYintuLearnView *secondLearnView = [[MFYintuLearnView alloc] initWithFrame:CGRectZero];
    secondLearnView.backgroundColor = [UIColor blueColor];
    secondLearnView.tag = 1;
    [self.view addSubview:secondLearnView];
    
    MFYintuLearnView *firstLearnView = [[MFYintuLearnView alloc] initWithFrame:CGRectZero];
    firstLearnView.backgroundColor = [UIColor redColor];
    firstLearnView.tag = 0;
    [self.view addSubview:firstLearnView];
    
    [firstLearnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(100);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 400));
    }];
    
    [secondLearnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(90);
        make.size.mas_equalTo(CGSizeMake(300, 400));
        make.centerX.mas_equalTo(self.view).mas_offset(20);
    }];
    
    self.viewsArray = @[firstLearnView, secondLearnView];
    self.currentTag = 0;
}

- (void)initData
{
    self.daraArray = [[NSMutableArray alloc] init];
    NSArray *levelArray = [[URService shareObbject].phonogramLearnService getLearnLevelArray:0];
    for (int i = 0; i < levelArray.count; i++) {
        NSString *key = [levelArray objectAtIndex:i];
        URLearnPhonogramModel *model = [[URService shareObbject].phonogramLearnService getLearnPhonogramItemInfo:key];
        [self.daraArray addObject:model];
    }
    
    self.currentLearnIndex = 0;
}

- (void)loadData
{
    for(int i = 0; i < 2; i++) {
        if (i < self.daraArray.count) {
            URLearnPhonogramModel *model = [self.daraArray objectAtIndex:i];
            MFYintuLearnView *view = [self.viewsArray objectAtIndex:i];
            view.phonogramModel = model;
        }
    }
}

#pragma mark - action

- (void)onNextBtcClicked:(id)sender
{
    self.currentLearnIndex += 1;
    if (self.currentLearnIndex >= self.daraArray.count) {
        self.currentLearnIndex = 0;
    }
    
    [self switchData];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self moveController];
    } completion:^(BOOL finished) {
        [self switchCurrentTag];
        
    }];
}

- (void)onPrevBtnClicked:(id)sender
{
    self.currentLearnIndex -= 1;
    if (self.currentLearnIndex < 0) {
        self.currentLearnIndex = self.daraArray.count - 1;
    }
    
    UIView *nextView = [self.viewsArray objectAtIndex:[self getNextTag]];
    [nextView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_offset(-500);
        make.centerX.mas_equalTo(self.view);
    }];
    [self.view layoutIfNeeded];
    [self.view bringSubviewToFront:nextView];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self addViewFromTop];
    } completion:^(BOOL finished) {
        [self switchPrevPage];
    }];
}

#pragma mark - helper

- (void)addViewFromTop
{
    UIView *nextView = [self.viewsArray objectAtIndex:[self getNextTag]];
    [nextView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
    }];
    [self.view layoutIfNeeded];
}

- (void)switchPrevPage
{
    UIView *currentView = [self.viewsArray objectAtIndex:self.currentTag];
    [currentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view).mas_offset(20);
        make.top.mas_equalTo(90);
    }];
    
    [self.view layoutIfNeeded];
    self.currentTag = [self getNextTag];
}

- (void)moveController
{
    UIView *learnView = [self.viewsArray objectAtIndex:self.currentTag];
    [UIView animateWithDuration:0.5 animations:^{
        [learnView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view).mas_offset(-learnView.frame.size.width - self.view.frame.size.width);
        }];
    }];
    [self.view layoutIfNeeded];
}

- (void)switchCurrentTag
{
    NSUInteger nextTag = [self getNextTag];
    UIView *nextView = [self.viewsArray objectAtIndex:nextTag];
    [self.view bringSubviewToFront:nextView];
    
    UIView *currentView = [self.viewsArray objectAtIndex:self.currentTag];
    [currentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view).mas_offset(40);
        make.top.mas_equalTo(self.view).mas_offset(110);
    }];
    [self.view layoutIfNeeded];
    
    [UIView animateWithDuration:0.5 animations:^{
        [nextView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).mas_offset(90);
            make.centerX.mas_equalTo(self.view);
        }];
        
        [currentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).mas_offset(100);
            make.centerX.mas_equalTo(self.view).mas_equalTo(20);
        }];
        
        [self.view layoutIfNeeded];
    }];

    self.currentTag = nextTag;
}

- (void)switchData
{
    NSUInteger nextTag = [self getNextTag];
    MFYintuLearnView *view = [self.viewsArray objectAtIndex:nextTag];
    
    if (self.currentLearnIndex < self.daraArray.count) {
        URLearnPhonogramModel *model = [self.daraArray objectAtIndex:self.currentLearnIndex];
        view.phonogramModel = model;
    }
}

- (NSInteger)getNextTag
{
    return  (self.currentTag + 1)%2;
}

@end
