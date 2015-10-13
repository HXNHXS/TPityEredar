//
//  SPFclassify.m
//  TPityEredar
//
//  Created by Mac on 15-8-1.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "SPFclassify.h"

@implementation SPFclassify
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self)
    {
        self.ID = [dic objectForKey:@"id"] ;
        self.seq = [dic objectForKey:@"seq"] ;
        self.name = [dic objectForKey:@"name"];
        self.labelld= [dic  objectForKey:@"labelId"];
        self.title = dic[@"title"];
        self.picUrl = dic[@"picUrl"];
        self.countLike = dic[@"countLike"];
        self.bigPicUrl = dic[@"bigPicUrl"];
        self.price = dic[@"price"];
        self.taobaoUrl = dic[@"taobaoUrl"];
        
    }
    return self;
}

@end
