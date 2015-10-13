//
//  CustomCollectionViewCell.m
//  TPityEredar
//
//  Created by Mac on 15-7-30.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        _picimage = [[UIImageView alloc] init];
        
        [self.contentView addSubview:_picimage];
        
        _priceLable = [[UILabel alloc] init];
        _priceLable.textColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:1];
       
        _priceLable.font = [UIFont systemFontOfSize:24];
        _priceLable.textAlignment = NSTextAlignmentCenter;
        _priceLable.font = [UIFont systemFontOfSize:10.0f];
        [self.contentView addSubview:_priceLable];

        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
   
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
