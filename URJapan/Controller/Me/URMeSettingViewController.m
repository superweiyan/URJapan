//
//  URMeSettingViewController.m
//  URJapan
//
//  Created by lin weiyan on 15/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URMeSettingViewController.h"
#import "URMarco.h"
#import "Masonry.h"
#import "URLabViewController.h"

@interface URMeSettingViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView   *itemTableView;
@property (nonatomic, strong) NSArray       *itemArray;

@end

@implementation URMeSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DefaultBGColor();
    
    // Do any additional setup after loading the view.
    self.itemTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.itemTableView.delegate = self;
    self.itemTableView.dataSource = self;
    [self.view addSubview:self.itemTableView];
    
    [self.itemTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    self.itemArray = @[@"实验室"];
}

- (void)dealloc
{
    self.itemTableView.delegate = nil;
    self.itemTableView.dataSource = nil;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    
    if (indexPath.row < self.itemArray.count) {
        NSString *title = [self.itemArray objectAtIndex:indexPath.row];
        cell.textLabel.text = title;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.itemArray.count) {
        URLabViewController *controller = [[URLabViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
