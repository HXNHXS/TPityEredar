//
//  Entity.h
//  TPityEredar
//
//  Created by Mac on 15-7-31.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Entity : NSManagedObject

@property (nonatomic, retain) NSString * countlike;
@property (nonatomic, retain) NSString * picUrl;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSString * taobaoUrl;
@property (nonatomic, retain) NSString * title;

@end
