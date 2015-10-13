//
//  ZYlistTableViewCell.m
//  SnackOnTalent
//
//  Created by Shaocong Zhai on 15/4/5.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "MoreTableViewCell.h"

@implementation MoreTableViewCell

- (void)dealloc
{
    self.messageLabel = nil;
    self.timeLabel = nil;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_timeLabel];
        _backImageView = [[UIImageView alloc]init];
        [self addSubview:_backImageView];
        _messageLabel = [[UILabel alloc]init];
        _messageLabel.numberOfLines = 0 ;
        _messageLabel.textColor = [UIColor blackColor];
        _messageLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_messageLabel];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
