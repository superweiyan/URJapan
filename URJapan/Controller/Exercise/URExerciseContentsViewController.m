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
    URSwitchCardView *cardView = [[URSwitchCardView alloc] initWithFrame:CGRectMake(10, 100, URScreenWidth() - 20, 100)];
    [self.view addSubview:cardView];
    
    UIColor *Color = [UIColor grayColor];
    UIColor *Color1 = [UIColor purpleColor];
    UIColor *Color2 = [UIColor blueColor];
    UIColor *Color3 = [UIColor grayColor];
    UIColor *Color4 = [UIColor blueColor];
    
    NSArray *array = @[Color, Color1, Color2, Color3, Color4];
    [cardView updateData:array];
}


@end
