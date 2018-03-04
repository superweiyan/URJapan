//
//  URFaultWordViewController.m
//  URJapan
//
//  Created by lin weiyan on 04/03/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URFaultWordViewController.h"
#import "URMarco.h"

@interface URFaultWordViewController ()

@end

@implementation URFaultWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DefaultBGColor()
    // Do any additional setup after loading the view.
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
    self.navigationItem.title = @"错词本";
}
@end
