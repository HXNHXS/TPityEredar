//
//  SubjectModel.h
//  TPityEredar
//
//  Created by Mac on 15-7-28.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubjectModel : NSObject
-(id)initWithDictionary:(NSDictionary *)dic;
//主题列表数据
@property(nonatomic,copy)NSString *ID,*name,*pic,*subDesc;
//主题详情数据
@property(nonatomic,copy)NSString *title,*countLike,*picUrl,*bigPicUrl,*price,*taobaoUrl;
@end
