//
//  ClassVC.h
//  TPityEredar
//
//  Created by Mac on 15-8-1.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"SPFclassify.h"
@interface ClassVC : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

{
    //    表格视图,收集视图
    UICollectionView                    *_collectionView;
    
    NSMutableArray  * _array;
    
}
@property(nonatomic,strong)SPFclassify *object;

@end
