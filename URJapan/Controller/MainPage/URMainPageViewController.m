//
//  URMainPageViewController.m
//  URJapan
//
//  Created by lin weiyan on 18/12/2017.
//  Copyright © 2017 URWY. All rights reserved.
//

#import "URMainPageViewController.h"
#import "Masonry/Masonry.h"
#import "URMarco.h"

@interface URMainPageViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView         *_tableView;
    NSArray             *_dataArray;
}
@end

@implementation URMainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self initViews];
    [self initConstraints];
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
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
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)initConstraints
{
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)initData
{
    _dataArray = @[@"50音图", @"语法", @"闯关练习"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.row < _dataArray.count) {
        NSString *lessionName = [_dataArray objectAtIndex:indexPath.row];
        cell.textLabel.text = lessionName;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:NewController(@"URPhonogramViewController") animated:YES];
    }
    else if (indexPath.row == 2) {
        [self.navigationController pushViewController:NewController(@"URExerciseContentsViewController") animated:YES];
    }
}

@end
