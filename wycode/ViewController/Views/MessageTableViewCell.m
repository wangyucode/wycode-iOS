//
//  MessageTableViewCell.m
//  wycode
//
//  Created by wangyu on 16/2/29.
//  Copyright © 2016年 wangyu. All rights reserved.
//

#import "MessageTableViewCell.h"
#import "WyResult.h"

@interface MessageTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *labelContent;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;

@end

@implementation MessageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUpWithModel:(BoardMessage *)entity{
    _labelContent.text = entity.content;
    _labelName.text = entity.name;
    _labelTime.text = entity.time;
}

@end
