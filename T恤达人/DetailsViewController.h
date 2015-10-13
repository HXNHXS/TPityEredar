//
//  DetailsViewController.h
//  TPityEredar
//
//  Created by mac on 15-7-30.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotSingletonType.h"
@interface DetailsViewController : UIViewController{
    
        // 大图片
    UIImageView *_bigPicImageView;
        // 名字Label
    UILabel     *_nameLabel;
        // 人民币符号Label
    UILabel     *_moneyLabel;
        // 价钱Label
    UILabel     *_priceLabel;
        // 横线
    UIImageView *_acrossLineImageView;
        // 竖线
    UIImageView *_uprightLineImageView;
        // 心型图片
    UIButton    *_heartButton;
        // 喜欢Label
    UILabel     *_loveLabel;
        // 分享图片按钮
    UIButton    *_shareButton;
        // 分享Label
    UILabel     *_shareLabel;
        // 收藏Label
    UIImageView *_collectImageView;
        // 收藏数字Label
    UILabel     *_collectFigureLabel;
        // Label
    UILabel     *_label;
        // 淘宝详情Button
    UIButton    *_taoBaoDetailsButton;
    
}
    // 传值 用的 
@property (nonatomic,strong) HotSingletonType *typeH;

@end
