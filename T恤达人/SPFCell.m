//
//  SPFCell.m
//  TPityEredar
//
//  Created by Mac on 15-8-1.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "SPFCell.h"

@implementation SPFCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
        [self.contentView addSubview:_nameLabel];
        
        
        
        _array=[NSMutableArray array];
        
        for (int i=0; i<3; i++)
        {
            _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10+(55+40)*i, 40, 80, 80)];
            _headImageView.layer.cornerRadius=8;
            _headImageView.layer.masksToBounds = YES;
            
            [self.contentView addSubview:_headImageView];
            [_array addObject:_headImageView];
        }
        
        
        
        
        
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
