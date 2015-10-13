//
//  MyCell.h
//  TPityEredar
//
//  Created by 密码 on 15-7-30.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *imageButton;

@property (weak, nonatomic) IBOutlet UILabel *oneTabel;

@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *twoLabel;

@end
