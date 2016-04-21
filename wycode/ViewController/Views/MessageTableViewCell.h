//
//  MessageTableViewCell.h
//  wycode
//
//  Created by wangyu on 16/2/29.
//  Copyright © 2016年 wangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BoardMessage;

@interface MessageTableViewCell : UITableViewCell

- (void)setUpWithModel:(BoardMessage *)entity;

@end
