//
//  MovieTableViewCell.h
//  wycode
//
//  Created by wangyu on 16/2/20.
//  Copyright © 2016年 wangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Movie;

@interface MovieTableViewCell : UITableViewCell

- (void)setUpWithModel:(Movie *)entity;

@end
