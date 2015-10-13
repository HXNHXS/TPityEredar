//
//  SPFclassify.h
//  TPityEredar
//
//  Created by Mac on 15-8-1.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPFclassify : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@property (nonatomic,copy)NSString  *ID;
@property (nonatomic,copy)NSString  *seq;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *labelld;

@property (nonatomic,copy)NSString  *title;
@property (nonatomic,copy)NSString  *countLike;
@property (nonatomic,copy)NSString  *picUrl;
@property (nonatomic,copy)NSString  *bigPicUrl;
@property (nonatomic,copy)NSString  *price;
@property (nonatomic,copy)NSString *taobaoUrl;


@end

