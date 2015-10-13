//
//  CommonTools.h
//  TPityEredar
//
//  Created by Mac on 15-7-30.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Entity.h"
#import "History.h"
#import "SubjectModel.h"
@interface CommonTools : NSObject
//插入数据到喜欢数据库
+(void)insertCoreDataWithTitle:(NSString *)title
                     Countlike:(NSString *)countlike
                        PicUrl:(NSString *)picurl
                     TaobaoUrl:(NSString *)taobaoUrl
                         Price:(NSString *)price;
//查询数据(返回喜欢数组)
+(NSMutableArray *)queryCoreData;
//插入数据到历史数据库
+(void)insertHistoryDataWithTitle:(NSString *)title
                        Countlike:(NSString *)countlike
                           PicUrl:(NSString *)picurl
                        TaobaoUrl:(NSString *)taobaoUrl
                            Price:(NSString *)price;

//查询数据（返回历史数组）
+(NSMutableArray *)queryHistoryData;

//清空缓存
+(void)deleteEntityCoreData;

+(void)deleteHistoryCoreData;
@end
