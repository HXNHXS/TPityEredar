//
//  AppDelegate.h
//  TPityEredar
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


//管理对象的那个模块--- 它就是数据库本身
/*NSManagedObjectContext  它参与整个数据库的操作过程，也就是说 它是持有Manager object的，我们可以通过它来监测某一个对象的数据操作，也就是说所有对数据对象的操作都与它有关
 */
@property(nonatomic,strong,readonly)NSManagedObjectContext *managedObjectContext;
//它是一个数据中的对象 -- 是其中的一张表
//它就是去寻找CoreDataDemo.xcdatamodeld
@property(nonatomic,strong,readonly)NSManagedObjectModel *managedObjectModel;
// 它是一个中转站 用于将数据，数据库，modle连接的东西
//这个中转站的管理是默认写好的 我们不需要过多的管理

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
//是一个Douctment 下的路径 就是数据库的路径
- (NSURL *)applicationDocumentsDirectory;
@end
