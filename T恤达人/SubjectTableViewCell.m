//
//  SubjectTableViewCell.m
//  TPityEredar
//
//  Created by Mac on 15-7-28.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "SubjectTableViewCell.h"

@implementation SubjectTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    
}

-(UIImageView*)footimage
{
    if (!_footimage)
    {
        _footimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 275, self.frame.size.width, 20)];
        
        [self addSubview:_footimage];
    }
    return _footimage;
}
-(UIImageView *)picimage
{
    if (!_picimage)
    {
        _picimage = [[UIImageView alloc]init];
        [self addSubview:_picimage];
    }
    return _picimage;
}
-(UILabel *)namelable
{
    if (!_namelable)
    {
        _namelable = [[UILabel alloc]initWithFrame:CGRectMake(20, 175,self.frame.size.width-40 , 30)];
        _namelable.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.6 ];
        _namelable.textColor = [UIColor whiteColor];
        
        
        [self addSubview:_namelable];
    }
    return _namelable;
}
-(UILabel *)productslable
{
    if (!_productslable)
    {
        _productslable = [[UILabel alloc]init];
        _productslable.numberOfLines = 0;
        [self addSubview:_productslable];
    }
    return _productslable;
}
-(UILabel *)countLikeLable
{
    if (!_countLikeLable)
    {
        _countLikeLable = [[UILabel alloc]init];
        _countLikeLable.numberOfLines = 0;
        [self addSubview:_countLikeLable];
    }
    return _countLikeLable;
}

-(UIImageView *)productsimage
{
    if (!_productsimage)
    {
        _productsimage = [[UIImageView alloc]init];
        
        [self addSubview:_productsimage];
    }
    return _productsimage;
}
-(UIImageView *)xiangqingimage
{
    if (!_xiangqingimage)
    {
        _xiangqingimage = [[UIImageView alloc]init];
        
        [self addSubview:_xiangqingimage];
    }
    return _xiangqingimage;
}
-(UIButton *)taobaoButton
{
    if (!_taobaoButton)
    {
        _taobaoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_taobaoButton setTitle:@"淘宝" forState:UIControlStateNormal];
        [_taobaoButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [self addSubview:_taobaoButton];
    }
    return _taobaoButton;
    
}
-(UIButton *)countLikeButton
{
    if (!_countLikeButton)
    {
        _countLikeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_countLikeButton setTitle:@"收藏" forState:UIControlStateNormal];
        [_countLikeButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [self addSubview:_countLikeButton];
    }
    return _countLikeButton;
    
}
-(UIButton *)shareButton
{
    if (!_shareButton)
    {
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareButton setTitle:@"分享" forState:UIControlStateNormal];
        [_shareButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [self addSubview:_shareButton];
    }
    return _shareButton;
    
}






@end
