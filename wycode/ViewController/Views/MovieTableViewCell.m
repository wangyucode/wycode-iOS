//
//  MovieTableViewCell.m
//  wycode
//
//  Created by wangyu on 16/2/20.
//  Copyright © 2016年 wangyu. All rights reserved.
//

#import "MovieTableViewCell.h"
#import "WyResult.h"
#import "UIImageView+AFNetworking.h"
#import "EasyHttp.h"

@interface MovieTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelContent;
@property (weak, nonatomic) IBOutlet UIImageView *ivMain;
@property (weak, nonatomic) IBOutlet UILabel *labelRating;
@property (weak, nonatomic) IBOutlet UILabel *labelYear;

@end


@implementation MovieTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUpWithModel:(Movie *)entity {
    
    _labelTitle.text = entity.name;
    _labelContent.text = entity.desc;
    _labelRating.text = [NSString stringWithFormat:@"%.1f分",entity.rating];
    _labelYear.text = [NSString stringWithFormat:@"%d年",entity.year];
    [_ivMain setImageWithURL:[NSURL URLWithString:[SERVER_URL stringByAppendingString:entity.image]]];
}


@end
