//
// Created by wangyu on 16/2/19.
// Copyright (c) 2016 wangyu. All rights reserved.
//

#import "MyNaviController.h"
#import "UIColor+Extension.h"


@implementation MyNaviController {


}

+(void)initialize {
    UINavigationBar *bar=[UINavigationBar appearance];
    bar.tintColor=[UIColor whiteColor];
    //背景色 #15b28a
    bar.barTintColor = [UIColor red:0 green:189 blue:156];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}
@end