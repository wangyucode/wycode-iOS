//
// Created by wangyu on 16/2/23.
// Copyright (c) 2016 wangyu. All rights reserved.
//

#import "MyTabBarController.h"
#import "MovieListViewController.h"
#import "MusicListViewController.h"
#import "MyNaviController.h"
#import "UIColor+Extension.h"
#import "MessageListViewController.h"


@interface MyTabBarController()<UITabBarControllerDelegate>{

}
@end

@implementation MyTabBarController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    MovieListViewController *lvMovie = [[MovieListViewController alloc] initWithNibName:@"MovieListViewController" bundle:nil];
    MusicListViewController *lvMusic = [[MusicListViewController alloc] initWithNibName:@"MusicListViewController" bundle:nil];
    MessageListViewController *lvMessage = [[MessageListViewController alloc] initWithNibName:@"MessageListViewController" bundle:nil];

    MyNaviController *naviMovie = [[MyNaviController alloc] initWithRootViewController:lvMovie];
    MyNaviController *naviMusic = [[MyNaviController alloc] initWithRootViewController:lvMusic];
    MyNaviController *naviMessage= [[MyNaviController alloc] initWithRootViewController:lvMessage];

    UITabBarItem *itemMovie = [[UITabBarItem alloc] initWithTitle:@"电影" image:[UIImage imageNamed:@"movie"] selectedImage:nil];
    UITabBarItem *itemMusic = [[UITabBarItem alloc] initWithTitle:@"音乐" image:[UIImage imageNamed:@"music"] selectedImage:nil];
    UITabBarItem *itemMessage = [[UITabBarItem alloc] initWithTitle:@"留言板" image:[UIImage imageNamed:@"message"] selectedImage:nil];

    naviMovie.tabBarItem = itemMovie;
    naviMusic.tabBarItem = itemMusic;
    naviMessage.tabBarItem = itemMessage;

    self.tabBar.tintColor = [UIColor red:0 green:189 blue:156];

    self.viewControllers = @[naviMovie,naviMusic,naviMessage];

    self.selectedIndex = 0;

    self.delegate=self;
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        [(UINavigationController *)viewController popToRootViewControllerAnimated:YES];
    }
}


@end