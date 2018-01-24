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

@interface URYintuExerciseViewController ()

@property (nonatomic, strong) UIImageView   *bgImageView;

@end

@implementation URYintuExerciseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DefaultBGColor()
    self.navigationItem.title = @"五十音图闯关";
    
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
    self.bgImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.bgImageView.image = [UIImage imageWithContentsOfFile:ResourcePath(@"闯关背景.jpg")];
    [self.view addSubview:self.bgImageView];
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

@end
