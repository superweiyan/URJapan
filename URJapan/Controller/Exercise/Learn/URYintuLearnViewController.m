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

@interface URYintuLearnViewController ()

@property (nonatomic, strong) UIButton              *nextBtn;
@property (nonatomic, strong) UIButton              *prevBtn;

@property (nonatomic, assign) NSUInteger            currentTag;
@property (nonatomic, strong) NSArray               *viewsArray;

@end

@implementation URYintuLearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DefaultBGColor()
    [self initViews];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initViews
{
    self.prevBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    self.prevBtn.backgroundColor = [UIColor redColor];
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
//        make.left.mas_equalTo(self.view).mas_offset(100);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 400));
    }];
    
    [secondLearnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(90);
//        make.left.mas_equalTo(self.view).mas_offset(140);
        make.size.mas_equalTo(CGSizeMake(300, 400));
        make.centerX.mas_equalTo(self.view).mas_offset(20);
    }];
    
    self.viewsArray = @[firstLearnView, secondLearnView];
    self.currentTag = 0;
}

- (void)loadData
{
    
}

- (void)onNextBtcClicked:(id)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        [self moveController];
    } completion:^(BOOL finished) {
        [self switchCurrentTag];
    }];
}

- (void)moveController
{
    UIView *learnView = [self.viewsArray objectAtIndex:self.currentTag];
    [learnView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.view.mas_left).mas_offset(-learnView.frame.size.width);
        make.centerX.mas_equalTo(self.view).mas_offset(-learnView.frame.size.width - self.view.frame.size.width);
    }];
    [self.view layoutIfNeeded];
}

- (void)switchCurrentTag
{
    NSUInteger nextTag = (self.currentTag + 1)%2;
    UIView *nextView = [self.viewsArray objectAtIndex:nextTag];
    [self.view bringSubviewToFront:nextView];
    
    UIView *currentView = [self.viewsArray objectAtIndex:self.currentTag];
    [currentView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.view).mas_offset(160);
        make.centerX.mas_equalTo(self.view).mas_offset(40);
        make.top.mas_equalTo(self.view).mas_offset(110);
    }];
    [self.view layoutIfNeeded];
    
    [UIView animateWithDuration:0.5 animations:^{
        [nextView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).mas_offset(90);
//            make.left.mas_equalTo(self.view).mas_offset(100);
            make.centerX.mas_equalTo(self.view);
        }];
        
        
        [currentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).mas_offset(100);
//            make.left.mas_equalTo(self.view).mas_offset(140);
            make.centerX.mas_equalTo(self.view).mas_equalTo(20);
        }];
        
        [self.view layoutIfNeeded];
    }];

    self.currentTag = nextTag;
}

- (void)onPrevBtnClicked:(id)sender
{
    
}

@end
