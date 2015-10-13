//
//  NetWorkRequest.h
//  TPityEredar
//
//  Created by Mac on 15-7-28.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface NetWorkRequest : NSObject
//获取主题推荐数据
+(void)getRecommendCompletion:(void(^)(NSDictionary *dic))block;
//获取主题数据
+(void)getSubjectDataCompletion:(void(^)(NSDictionary *dic))block;
//获取详细主题数据
+(void)getDetailSubjectDataWithString:(NSString *)url Completion:(void(^)(NSDictionary *dic))block;
//上拉加载一次数据
+(void)getSubjectDataOneCompletion:(void(^)(NSDictionary *dic))block;
//上拉加载二次数据
+(void)getSubjectDataTwoCompletion:(void(^)(NSDictionary *dic))block;



//获取热门数据
+ (void) getHotPageCompletion:(void(^)(NSDictionary *dic))block;

//获取分类列表数据
+ (void)requestClassifyListWithCompletion:(void (^)(NSDictionary *dic))block;
//获取分类详情数据
+ (void)requestDetailClassifyListWithlabelld:(int )labelld Completion:(void (^)(NSDictionary *dic))block;



@end
