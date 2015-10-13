//
//  HotViewController.h
//  TPityEredar
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UICollectionViewWaterfallLayout.h"


@interface HotViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateWaterfallLayout>{
    
    NSMutableArray *_array;
    
    UICollectionView *_collectionView;
    
}


@end
