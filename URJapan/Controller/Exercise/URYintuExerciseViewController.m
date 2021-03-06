//
//  URYintuExerciseViewController.m
//  URJapan
//
//  Created by lin weiyan on 24/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URYintuExerciseViewController.h"
#import "URMarco.h"
#import "Masonry/Masonry.h"
#import "URLevelPathHelper.h"
#import "URYintuTestViewController.h"
#import "URFaultWordViewController.h"

#import "URService.h"
#import "URRecordService.h"

#import "URToast.h"
#import "URLevelSelectView.h"

@interface URYintuExerciseViewController ()<URLevelSelectViewDelegate>

@property (nonatomic, strong) UIImageView           *bgImageView;
@property (nonatomic, strong) NSArray               *levelArray;
@property (nonatomic, weak)   URLevelSelectView     *selectView;

@end

@implementation URYintuExerciseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DefaultBGColor()
    self.navigationItem.title = @"五十音图闯关";
    
    [self initViews];
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData
{
    self.levelArray = [[URLevelPathHelper sharedObject] getAllLevelPosition];
    [self initLevel];
}

- (void)initViews
{
    self.bgImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.bgImageView.image = [UIImage imageWithContentsOfFile:ResourcePath(@"闯关背景.jpg")];
    
    [self.view addSubview:self.bgImageView];
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)initLevel
{
    for (int i = 0; i < self.levelArray.count; i++) {
        URPosition *position = [self.levelArray objectAtIndex:i];
        
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:@(i).stringValue forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:25];
        btn.layer.cornerRadius = 25;
        btn.layer.borderColor = [UIColor redColor].CGColor;
        btn.layer.borderWidth = 2;
        btn.tag = i;
        [btn addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        CGFloat x = URScreenWidth() * position.x;
        CGFloat y = URScreenHeight() * (1 - position.y);
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.left.mas_equalTo(self.view).mas_offset(x);
            make.top.mas_equalTo(self.view).mas_offset(y);
        }];
    }
}

- (void)onBtnClicked:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSUInteger level = btn.tag;
    
    if (level > 0) {
        NSUInteger currentLevel = [[URService shareObbject].recordService getPastLevel:@"yuyin"];
        if (level > currentLevel) {
            [URToast showTitle:@"先学上一课吧"];
            return ;
        }
    }
    
    
    URLevelSelectView *view = [[URLevelSelectView alloc] init];
    view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.4];
    view.delegate = self;
    [self.view addSubview:view];
    view.level = level;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 150));
        make.centerX.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view);
    }];
    
    view.transform = CGAffineTransformMakeScale(0.1, 0.1);
    
    [UIView animateWithDuration:0.5 animations:^{
        view.transform = CGAffineTransformMakeScale(1, 1);
    }];
    
    self.selectView = view;
    
    WeakSelf()
    view.levelClickback = ^(URLevelType type, NSUInteger level) {
        [weakSelf.selectView removeFromSuperview];
        weakSelf.selectView = nil;
        [weakSelf jumpLevel:type level:level];
    };
}

- (void)onCloseSelectView
{
    [self.selectView removeFromSuperview];
    self.selectView = nil;
}

- (void)jumpLevel:(URLevelType)levelType level:(NSUInteger)level
{
    if (levelType == URLevelType_Learn) {
        [self.navigationController pushViewController:NewController(@"URYintuLearnViewController") animated:YES];
    }
    else if (levelType == URLevelType_Test) {
        URYintuTestViewController *testViewController = [[URYintuTestViewController alloc] init];
        testViewController.level = level;
        [self.navigationController pushViewController:testViewController animated:YES];
    }
    else if (levelType == URLevelType_FaultWord) {
        URFaultWordViewController *faultWordController = [[URFaultWordViewController alloc] init];
        faultWordController.level = level;
        [self.navigationController pushViewController:faultWordController animated:YES];
    }
}

@end
