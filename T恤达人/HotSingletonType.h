//
//  HotSingletonType.h
//  TPityEredar
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface HotSingletonType : NSObject

- (instancetype) initWithDictionary:(NSDictionary *)dic;

@property (nonatomic,copy) NSString *hotID;

@property (nonatomic,copy) NSString *cateId;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *countLike;

@property (nonatomic,copy) NSString *picUrl;

@property (nonatomic,copy) NSString *bigPicUrl;

@property (nonatomic,copy) NSString *price;

@property (nonatomic,copy) NSString *itemUrl;

@property (nonatomic,copy) NSString *taobaoUrl;

@property (nonatomic,copy) NSString *proDesc;

@property (nonatomic,copy) NSString *width;

@property (nonatomic,copy) NSString *height;

@end
