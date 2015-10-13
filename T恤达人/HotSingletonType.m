//
//  HotSingletonType.m
//  TPityEredar
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "HotSingletonType.h"

@implementation HotSingletonType

    /* 
     * 单例类的初始化方法
     */
- (instancetype) initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.hotID = [dic objectForKey:@"id"];
        
        self.cateId = [dic objectForKey:@"cateId"];
        
        self.title = [dic objectForKey:@"title"];
        
        self.countLike = [dic objectForKey:@"countLike"];
        
        self.picUrl = [dic objectForKey:@"picUrl"];
        
        self.bigPicUrl = [dic objectForKey:@"bigPicUrl"];
        
        self.price = [dic objectForKey:@"price"];
        
        self.itemUrl = [dic objectForKey:@"itemUrl"];
        
        self.taobaoUrl = [dic objectForKey:@"taobaoUrl"];
        
        self.proDesc = [dic objectForKey:@"proDesc"];
        
        self.width = [dic objectForKey:@"width"];
        
        self.height = [dic objectForKey:@"height"];
    }
    return self;
}

@end
