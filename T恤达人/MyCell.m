//
//  MyCell.m
//  TPityEredar
//
//  Created by 密码 on 15-7-30.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)awakeFromNib
{
    self.backgroundColor=[UIColor whiteColor];
    self.layer.cornerRadius=15;
    self.layer.masksToBounds=YES;
    self.layer.borderWidth=1;
    self.layer.borderColor=[UIColor grayColor].CGColor;
    
    
    
    self.imageButton.userInteractionEnabled=NO;
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
