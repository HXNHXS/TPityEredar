//
//  HotCell.h
//  TPityEredar
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotCell : UICollectionViewCell{
    
    /* 图片
     * 价钱
     * 收藏
     * 心形图片
     * 金钱标示
     */
    UIImageView *contentImageView;
    UILabel     *priceLab;
    UILabel     *countLikeLabel;
    UIImageView *heartImageView;
    UILabel     *moneyLabel;
}

@property (nonatomic,strong) UIImageView *contentImageView;

@property (nonatomic,strong) UILabel     *priceLab;

@property (nonatomic,strong) UILabel     *countLikeLabel;

@property (nonatomic,strong) UIImageView *heartImageView;

@property (nonatomic,strong) UILabel     *moneyLabel;

@end
