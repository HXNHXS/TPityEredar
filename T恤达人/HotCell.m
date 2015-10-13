//
//  HotCell.m
//  TPityEredar
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "HotCell.h"

@implementation HotCell

@synthesize contentImageView;
@synthesize priceLab;
@synthesize countLikeLabel;
@synthesize heartImageView;
@synthesize moneyLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        heartImageView = [[UIImageView alloc] init];
        heartImageView.image = [UIImage imageNamed:@"like2@2x"];
        [self.contentView addSubview:heartImageView];
     
        priceLab = [[UILabel alloc] init];
        priceLab.numberOfLines = 1;
        priceLab.textColor = [UIColor colorWithRed:254.0/255.0f green:73.0/255.0f blue:220.0/255.0f alpha:1];
        priceLab.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:priceLab];
        
        countLikeLabel = [[UILabel alloc] init];
        countLikeLabel.numberOfLines = 1;
        countLikeLabel.textColor = [UIColor grayColor];
        countLikeLabel.font = [UIFont systemFontOfSize:12.0f];
        [self.contentView addSubview:countLikeLabel];
        
        contentImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:contentImageView];
    
        moneyLabel = [[UILabel alloc] init];
        moneyLabel.text = @"￥";
        moneyLabel.textAlignment = NSTextAlignmentCenter;
        moneyLabel.font = [UIFont systemFontOfSize:15.0f];
        moneyLabel.textColor = [UIColor colorWithRed:254.0/255.0f green:73.0/255.0f blue:220.0/255.0f alpha:1];
        [self.contentView addSubview:moneyLabel];
    }
    return self;
}
- (void) layoutSubviews{
    
    [super layoutSubviews];
    
    float x = self.contentView.bounds.size.width;
    float y = self.contentView.bounds.size.height;

    
    contentImageView.frame = CGRectMake((self.contentImageView.frame.size.width / 2.0f) + 5 , y - 80.0f, (x - (self.contentImageView.frame.size.width / 2.0f ) - 10) , y - self.priceLab.frame.size.height - 20);
    contentImageView.layer.cornerRadius = 10;
    contentImageView.layer.masksToBounds = YES;
    
    moneyLabel.frame = CGRectMake(15, y - self.contentImageView.frame.size.height + 181, 15, 20);
    
    priceLab.frame = CGRectMake( 30, y - self.contentImageView.frame.size.height + 170, self.contentImageView.frame.size.width / 2.0f  , 40);
    
    countLikeLabel.frame = CGRectMake(x - self.priceLab.frame.size.width + 30,y - self.contentImageView.frame.size.height + 170 , x - self.priceLab.frame.size.width,40);
    
    heartImageView.frame = CGRectMake(x - self.priceLab.frame.size.width + 15, y - self.contentImageView.frame.size.height + 185, 10, 10);
    
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
