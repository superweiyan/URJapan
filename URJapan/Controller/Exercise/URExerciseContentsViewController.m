//
//  URExerciseContentsViewController.m
//  URJapan
//
//  Created by lin weiyan on 19/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URExerciseContentsViewController.h"
#import "URMarco.h"
#import "URSwitchCardView.h"
#import "URLessionModel.h"

@interface URExerciseContentsViewController ()

@end

@implementation URExerciseContentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DefaultBGColor();
    
    [self addLessions];
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

- (void)addLessions
{
    URSwitchCardView *cardView = [[URSwitchCardView alloc] initWithFrame:CGRectMake(10, 100, URScreenWidth() - 20, 140)];
    WeakSelf()
    cardView.switchCardCallback = ^(NSUInteger index) {
        [weakSelf onSwitchCardClick:index];
    };
    [self.view addSubview:cardView];
    
    NSArray *lessionTitleArray = @[@"五十音图", @"初级语法", @"N5单词"];
    
    NSMutableArray *lessionArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < lessionTitleArray.count; i++) {
        URLessionModel *lessionModel = [[URLessionModel alloc] init];
        lessionModel.lessionName = [lessionTitleArray objectAtIndex:i];
        lessionModel.iconName = @"50音图.jpg";
        [lessionArray addObject:lessionModel];
    }
    [cardView updateData:lessionArray];
}

#pragma mark - logic

- (void)onSwitchCardClick:(NSUInteger)index
{
    [self.navigationController pushViewController:NewController(@"URYintuExerciseViewController") animated:YES];
}

@end
