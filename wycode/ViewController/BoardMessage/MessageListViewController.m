//
//  MessageListViewController.m
//  wycode
//
//  Created by wangyu on 16/2/29.
//  Copyright © 2016年 wangyu. All rights reserved.
//

#import "MessageListViewController.h"
#import "WyResult.h"
#import "EasyHttp.h"
#import "MessageTableViewCell.h"
#import "AddMessageViewController.h"
#import "SVProgressHUD.h"

@interface MessageListViewController ()<UITableViewDataSource, UITableViewDelegate>{
}
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (assign, nonatomic) int page;


@end

@implementation MessageListViewController

//复写get方法,延迟初始化
-(NSMutableArray *)data {
    if(!_data){
        _data = [NSMutableArray array];
    }
    return _data;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"留言板";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add_message"] style:UIBarButtonItemStyleDone target:self action:@selector(addNew)];
}

-(void)addNew{
    AddMessageViewController *addMessageVC = [[AddMessageViewController alloc] initWithNibName:@"AddMessageViewController" bundle:nil];
    addMessageVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:addMessageVC animated:YES];
}

-(void)getData{
    [SVProgressHUD show];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"page"] = [NSString stringWithFormat:@"%d",_page];
    params[@"size"] = @"10";
    [EasyHttp doPost:@"/api/board/getMessages"
              params:params
        successBlock:^(WyResult *result){
            [SVProgressHUD dismiss];
            MessagePage *page = [[MessagePage alloc] initWithDictionary:(NSDictionary *) result.data error:nil];
            if(page.size){
                if(!_page){
                    [_data removeAllObjects];
                }
                [self.data addObjectsFromArray:page.content];
                [_table reloadData];
            }
        }
        failureBlock:^(NSString *message,int code){
            [SVProgressHUD dismiss];
        }
    ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageTableViewCell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"MessageTableViewCell" owner:self options:nil].firstObject;
    }
    [cell setUpWithModel:_data[(NSUInteger) indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

@end
