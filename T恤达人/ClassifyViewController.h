//
//  ClassifyViewController.h
//  TPityEredar
//
//  Created by Mac on 15-8-1.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassifyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    NSMutableArray      *_classifyArray;
    NSMutableArray *content_array;
    UITableView * _tableView;
}
@end