//
//  MusicTableViewCell.m
//  wycode
//
//  Created by wangyu on 16/2/25.
//  Copyright © 2016年 wangyu. All rights reserved.
//

#import "MusicTableViewCell.h"
#import "WyResult.h"
#import "UIImageView+AFNetworking.h"
#import "EasyHttp.h"

@interface MusicTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *artist;
@property (weak, nonatomic) IBOutlet UILabel *album;
@property (weak, nonatomic) IBOutlet UILabel *year;


@end

@implementation MusicTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setUpWithModel:(Music *)entity {
    [_image setImageWithURL:[NSURL URLWithString:[SERVER_URL stringByAppendingString:entity.image]]];
    _name.text = entity.name;
    _artist.text = entity.artist;
    _album.text = entity.album;
    _year.text = [NSString stringWithFormat:@"%d年",entity.year];


}

@end
