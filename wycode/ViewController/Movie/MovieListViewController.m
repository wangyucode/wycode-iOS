//
// Created by wangyu on 16/2/19.
// Copyright (c) 2016 wangyu. All rights reserved.
//

#import "MovieListViewController.h"
#import "MovieTableViewCell.h"
#import "EasyHttp.h"
#import "WyResult.h"
#import "SVProgressHUD.h"
#import "wycode-Swift.h"


@interface MovieListViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) NSMutableArray *data;
@property(weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation MovieListViewController {


}

//复写get方法,延迟初始化
- (NSMutableArray *)data {
    if (!_data) {
        _data = [NSMutableArray array];
    }
    return _data;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电影";
    [self getData];
    
}


- (void)getData {
    [SVProgressHUD show];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"page"] = @"0";
    params[@"size"] = @"10";
    [EasyHttp doPost:@"/api/movie/getMovies"
              params:params
        successBlock:^(WyResult *result) {
            [SVProgressHUD dismiss];
            MoviePage *page = [[MoviePage alloc] initWithDictionary:(NSDictionary *) result.data error:nil];
            if (page.size) {
                [self.data addObjectsFromArray:page.content];
                [_tableView reloadData];
                
            }
        }
        failureBlock:^(NSString *message, int code) {
            [SVProgressHUD dismiss];
        }
    ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell *mainCell = [tableView dequeueReusableCellWithIdentifier:@"MovieTableViewCell"];
    if (!mainCell) {
        mainCell = [[NSBundle mainBundle] loadNibNamed:@"MovieTableViewCell" owner:self options:nil].firstObject;
    }
    [mainCell setUpWithModel:_data[(NSUInteger) indexPath.row]];
    return mainCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

//item点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MovieDetailSwiftController *detailView = [[MovieDetailSwiftController alloc] initWithNibName:@"MovieDetailSwiftController" bundle:nil];
    detailView.entity = _data[(NSUInteger) indexPath.row];
    detailView.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailView animated:YES];

}


@end