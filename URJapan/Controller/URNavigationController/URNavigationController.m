//
//  URNavigationController.m
//  URJapan
//
//  Created by lin weiyan on 15/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URNavigationController.h"

@interface URNavigationController ()

@end

@implementation URNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

//- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated
//{
//    UIViewController *controller = [super popViewControllerAnimated:animated];
//
//    if (self.viewControllers.count == 1) {
//        UIViewController *topController = self.topViewController;
//        topController.hidesBottomBarWhenPushed = NO;
//    }
//    return controller;
//}
//
//- (nullable NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
//{
//    NSArray *array = [super popToRootViewControllerAnimated:animated];
//    self.hidesBottomBarWhenPushed = NO;
//    return array;
//}

@end
