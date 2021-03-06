//
//  URMainViewController.m
//  URJapan
//
//  Created by weiyan on 13/09/2017.
//  Copyright © 2017 URWY. All rights reserved.
//

#import "URMainViewController.h"
#import "URLogger.h"
#import "URMainPageViewController.h"
#import "URMeSettingViewController.h"
#import "URNavigationController.h"

@interface URMainViewController ()<UITabBarDelegate>

@end

@implementation URMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    URMainPageViewController *lessionController  = [[URMainPageViewController alloc] init];
    
    UIViewController    *discoverController = [[UIViewController alloc] init];
    
    URMeSettingViewController *settingController = [[URMeSettingViewController alloc] init];
    
    [self addChildViewController:lessionController andTitle:@"首页" andImageName:nil];
    [self addChildViewController:discoverController andTitle:@"发现" andImageName:nil];
    [self addChildViewController:settingController andTitle:@"我" andImageName:nil];
    
//    LOGGER(@"12345667788");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildViewController:(UIViewController *)VC andTitle:(NSString *)title andImageName:(NSString *)imageName
{
    VC.title=title;
    
    VC.tabBarItem.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@nor",imageName]];
    VC.tabBarItem.selectedImage=[UIImage imageNamed:[NSString stringWithFormat:@"%@press",imageName]];
    
    self.tabBar.tintColor=[UIColor colorWithRed:13/255.0 green:184/255.0 blue:246/255.0 alpha:1];
    
    URNavigationController *nav = [[URNavigationController alloc] initWithRootViewController:VC];
    [self addChildViewController:nav];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.hidesBottomBarWhenPushed = NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if ([item.title isEqualToString:@"首页"]) {
        
    }
    else if ([item.title isEqualToString:@"发现"]){
        
    }
    else if ([item.title isEqualToString:@"我"]){
        
    }
}

@end
