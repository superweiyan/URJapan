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
#import "URYintuLearnViewController.h"
#import "URTTSTestView.h"

@interface URLabViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView       *testItemTableView;

@property (nonatomic, strong) NSArray           *testItemArray;
@property (nonatomic, strong) NSDictionary      *itemDict;

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
    
    self.testItemArray = @[@"toast", @"学习页面", @"播放文本声音"];
    
    self.itemDict = @{@"toast":NSStringFromSelector(@selector(testToast)),
                      @"学习页面":NSStringFromSelector(@selector(studyView)),
                      @"播放文本声音":NSStringFromSelector(@selector(TTSTest))
                      };
    
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
        NSString *title = [self.testItemArray objectAtIndex:indexPath.row];
        NSString *selName = [self.itemDict objectForKey:title];
        if (selName.length == 0) {
            return ;
        }
        
        SEL selector = NSSelectorFromString(selName);
        if([self respondsToSelector:selector]){
            [self performSelector:selector withObject:nil afterDelay:0];
        }
    }
}

- (void)testToast
{
    [URToast showTitle:@"hello"];
}
                                                   
- (void)studyView
{
    URYintuLearnViewController *yintuViewController = [[URYintuLearnViewController alloc] init];
    [self.navigationController pushViewController:yintuViewController animated:YES];
}

- (void)TTSTest
{    
    URTTSTestView * testView = [[URTTSTestView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    testView.backgroundColor = [UIColor whiteColor];
    [[UIApplication sharedApplication].keyWindow addSubview:testView];
}


@end
