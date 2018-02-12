//
//  URYintuTestViewController.m
//  URJapan
//
//  Created by lin weiyan on 05/02/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URYintuTestViewController.h"
#import "URMarco.h"

@interface URYintuTestViewController ()

@end

@implementation URYintuTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DefaultBGColor()
    
    [self initViews];

    self.navigationItem.title = [NSString stringWithFormat:@"第%ld关", (self.level+1)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init

- (void)initViews
{
    
}

@end
