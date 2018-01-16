//
//  URLabViewController.m
//  URJapan
//
//  Created by lin weiyan on 15/01/2018.
//  Copyright © 2018 URWY. All rights reserved.
//

#import "URLabViewController.h"
#import "URMarco.h"
#import "URToast.h"
#import "Masonry.h"

@interface URLabViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *testItemTableView;

@property (nonatomic, strong) NSArray     *testItemArray;

@end

@implementation URLabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DefaultBGColor()
    
    self.testItemTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.testItemTableView.delegate = self;
    self.testItemTableView.dataSource = self;
    [self.view addSubview:self.testItemTableView];
    
    [self.testItemTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    self.testItemArray = @[@"toast"];
    
    // Do any additional setup after loading the view.
}

- (void)dealloc
{
    self.testItemTableView.delegate = nil;
    self.testItemTableView.dataSource = nil;
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
    return self.testItemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testItemIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"testItemIdentifier"];
    }
    
    if (indexPath.row < self.testItemArray.count) {
        NSString *title = [self.testItemArray objectAtIndex:indexPath.row];
        cell.textLabel.text = title;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.testItemArray.count) {
        [self testToast];
    }
}


- (void)testToast
{
    [URToast showTitle:@"hello"];
}
@end
