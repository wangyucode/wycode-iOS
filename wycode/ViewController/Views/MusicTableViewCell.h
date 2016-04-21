//
//  MusicTableViewCell.h
//  wycode
//
//  Created by wangyu on 16/2/25.
//  Copyright © 2016年 wangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Music;

@interface MusicTableViewCell : UITableViewCell


- (void)setUpWithModel:(Music *)entity;

@end
