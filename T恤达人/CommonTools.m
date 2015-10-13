//
//  CommonTools.m
//  TPityEredar
//
//  Created by Mac on 15-7-30.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "CommonTools.h"

@implementation CommonTools


//插入数据

+(void)insertCoreDataWithTitle:(NSString *)title
                     Countlike:(NSString *)countlike
                        PicUrl:(NSString *)picurl
                     TaobaoUrl:(NSString *)taobaoUrl
                         Price:(NSString *)price
{
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    
    Entity * entity = [NSEntityDescription insertNewObjectForEntityForName:@"Entity" inManagedObjectContext:delegate.managedObjectContext];
    entity.title = title;
    entity.price = price;
    entity.countlike = countlike;
    entity.picUrl = picurl;
    entity.taobaoUrl =taobaoUrl;
    
    NSError *error = nil;
    if (![delegate.managedObjectContext save:&error])
    {
        NSLog(@"not save :%@",[error localizedDescription]);
    }
}
//查询数据

+(NSMutableArray *)queryCoreData
{
    
     AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    //获取数据库
    NSManagedObjectContext * managerContext = delegate.managedObjectContext ;
    //获取表
    NSEntityDescription * entityDes = [NSEntityDescription entityForName:@"Entity" inManagedObjectContext:managerContext];
    
    //创建一个空的命令集
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc]init];
    //设置查询表
    [fetchRequest  setEntity:entityDes];
    
    //查询表，返回内容
    NSArray * array = [managerContext  executeFetchRequest:fetchRequest error:nil];
    NSMutableArray *dataArray = [NSMutableArray array];
    for (Entity * entity in array)
    {
        SubjectModel*object = [[SubjectModel alloc]init];
        object.title = entity.title;
        object.picUrl = entity.picUrl;
        object.taobaoUrl = entity.taobaoUrl;
        object.countLike = entity.countlike;
        object.price = entity.price;
        [dataArray addObject:object];
    }
    return dataArray;
}

+(void)insertHistoryDataWithTitle:(NSString *)title
                        Countlike:(NSString *)countlike
                           PicUrl:(NSString *)picurl
                        TaobaoUrl:(NSString *)taobaoUrl
                            Price:(NSString *)price
{
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    
     History * history = [NSEntityDescription insertNewObjectForEntityForName:@"History" inManagedObjectContext:delegate.managedObjectContext];
    history.title = title;
    history.price = price;
    history.countlike = countlike;
    history.picUrl = picurl;
    history.taobaoUrl =taobaoUrl;
   
    NSError *error = nil;
    if (![delegate.managedObjectContext save:&error])
    {
        NSLog(@"not save :%@",[error localizedDescription]);
    }

    
}

+(NSMutableArray *)queryHistoryData
{
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    //获取数据库
    NSManagedObjectContext * managerContext = delegate.managedObjectContext ;
    //获取表
    NSEntityDescription * entityDes = [NSEntityDescription entityForName:@"History" inManagedObjectContext:managerContext];
    
    //创建一个空的命令集
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc]init];
    //设置查询表
    [fetchRequest  setEntity:entityDes];
    
    //查询表，返回内容
    NSArray * array = [managerContext  executeFetchRequest:fetchRequest error:nil];
    NSMutableArray *dataArray = [NSMutableArray array];
    for (History * history  in array)
    {
        SubjectModel*object = [[SubjectModel alloc]init];
        object.title = history.title;
        object.picUrl = history.picUrl;
        object.taobaoUrl = history.taobaoUrl;
        object.countLike = history.countlike;
        object.price = history.price;
        [dataArray addObject:object];
    }
    return dataArray;
}
+(void)deleteEntityCoreData
{
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    //获取数据库
    NSManagedObjectContext * managerContext = delegate.managedObjectContext ;
    //获取表
    NSEntityDescription * entityDes = [NSEntityDescription entityForName:@"Entity" inManagedObjectContext:managerContext];
    
    //创建一个空的命令集
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc]init];
    //设置查询表
    [fetchRequest  setEntity:entityDes];
    
    NSArray *records = [managerContext executeFetchRequest:fetchRequest error:nil];
    
    for (Entity *object in records)
    {
        [managerContext deleteObject:object];
        [managerContext save:nil];
    }
}
+(void)deleteHistoryCoreData
{
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    //获取数据库
    NSManagedObjectContext * managerContext = delegate.managedObjectContext ;
    //获取表
    NSEntityDescription * entityDes = [NSEntityDescription entityForName:@"History" inManagedObjectContext:managerContext];
    
    //创建一个空的命令集
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc]init];
    //设置查询表
    [fetchRequest  setEntity:entityDes];
    
    NSArray *records = [managerContext executeFetchRequest:fetchRequest error:nil];
    for (History *object in records)
    {
        [managerContext deleteObject:object];
        [managerContext save:nil];
    }
}
@end
