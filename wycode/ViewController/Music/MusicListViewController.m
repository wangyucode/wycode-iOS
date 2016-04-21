//
// Created by wangyu on 16/2/25.
// Copyright (c) 2016 wangyu. All rights reserved.
//

#import "MusicListViewController.h"
#import "WyResult.h"
#import "EasyHttp.h"
#import "MusicTableViewCell.h"
#import "MusicDetailViewController.h"
#import "SVProgressHUD.h"


@interface MusicListViewController()<UITableViewDataSource, UITableViewDelegate>{
}
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic, strong)NSMutableArray *data;

@end

@implementation MusicListViewController {

}

//复写get方法,延迟初始化
-(NSMutableArray *)data {
    if(!_data){
        _data = [NSMutableArray array];
    }
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"音乐";
    [self getData];
}


-(void)getData{
    [SVProgressHUD show];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"page"] = @"0";
    params[@"size"] = @"10";
    [EasyHttp doPost:@"/api/music/getMusics"
              params:params
        successBlock:^(WyResult *result){
            [SVProgressHUD dismiss];
            MusicPage *page = [[MusicPage alloc] initWithDictionary:(NSDictionary *) result.data error:nil];
            if(page.size){
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
    MusicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MusicTableViewCell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"MusicTableViewCell" owner:self options:nil].firstObject;
    }
    [cell setUpWithModel:_data[(NSUInteger) indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

//item点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MusicDetailViewController *detailVC = [[MusicDetailViewController alloc] initWithNibName:@"MusicDetailViewController" bundle:nil];
    detailVC.entity = _data[(NSUInteger) indexPath.row];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end