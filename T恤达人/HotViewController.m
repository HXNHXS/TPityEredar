//
//  HotViewController.m
//  TPityEredar
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "HotViewController.h"

#import "HotCell.h"

#import "HotSingletonType.h"

#import "DetailsViewController.h"


#define KCellIdentifier @"identifier"
#define CELL_WIDTH 150.0f
#define CELL_COLCount  2// 定义的列数

@interface HotViewController ()

@end

@implementation HotViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"热门";
    
    
    UICollectionViewWaterfallLayout *layout = [[UICollectionViewWaterfallLayout alloc] init];
    layout.delegate = self;
    
    /* 设置宽度
     * 设置列数
     */
    layout.itemWidth = CELL_WIDTH;
    layout.columnCount = CELL_COLCount;
    //设置上左下右四个方向Item距离边界的长度
    layout.sectionInset = UIEdgeInsetsMake(0,10, 120, 10);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(_collectionView.frame.size.width, _collectionView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    //    注册collectionViewCell
    [_collectionView registerClass:[HotCell class] forCellWithReuseIdentifier:KCellIdentifier];
    [self.view addSubview:_collectionView];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    _array = [[NSMutableArray alloc] init];
    //     请求数据
    [NetWorkRequest getHotPageCompletion:^(NSDictionary *dic) {
        NSMutableArray *arr = [dic objectForKey:@"result"];
        for (NSDictionary *imgDic in arr) {
            
            HotSingletonType *type = [[HotSingletonType alloc] initWithDictionary:imgDic];
            [_array addObject:type];
        }
        // 刷新
        [_collectionView reloadData];
    }];
}
#pragma mark - 数据源 数组
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _array.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = KCellIdentifier;
    HotCell * cell = (HotCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    HotSingletonType *type = [_array objectAtIndex:indexPath.row];
    
    NSURL *urlString = [NSURL URLWithString:type.picUrl];
    /* 图片
     *  价格
     *   收藏
     */
    [cell.contentImageView setImageWithURL:urlString];
    cell.priceLab.text = type.price;
    cell.countLikeLabel.text = type.countLike;
    return cell;
}
#pragma mark - 点击 collectionView push
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HotSingletonType *type = _array[indexPath.row];
    
    if (type.picUrl) {
        DetailsViewController *detailsVC = [[DetailsViewController alloc] init];
        // 从前  往后 传值
        detailsVC.typeH = type;
        // 隐藏 tabar
        detailsVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:detailsVC animated:YES];
    }
}
#pragma mark - collectionViewLayout 高度
- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterfallLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

@end
