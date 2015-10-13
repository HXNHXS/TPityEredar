//
//  CollectViewController.m
//  TPityEredar
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "CollectViewController.h"
#import "CollectDetailVC.h"
@interface CollectViewController ()

@end

@implementation CollectViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_segcontrol.selectedSegmentIndex==0)
    {
        [_dataArray removeAllObjects];
        _dataArray = [CommonTools queryCoreData];
        [_collection reloadData];
    }else
    {
        [_dataArray removeAllObjects];
        _dataArray = [CommonTools queryHistoryData];
        [_collection reloadData];
    }

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"收藏";
    [self createCollectionView];
    [self topView];

}
-(void)createCollectionView
{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    //设置cell 大小
    layout.itemSize = CGSizeMake(100 , 150);
    //左右的间距
    layout.minimumInteritemSpacing = 5;
    //上下的间距
    layout.minimumLineSpacing = 0;
    //设置上左下右四个方向Item距离边界的长度
    layout.sectionInset = UIEdgeInsetsMake(50, 5, 35, 5);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    _collection.delegate = self ;
    _collection.dataSource = self ;
    
    _collection.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collection];
    [_collection registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    

}
-(void)topView
{
    _segcontrol = [[UISegmentedControl alloc]initWithItems:@[@"喜欢",@"历史"]];
    _segcontrol.tintColor =[UIColor colorWithRed:1 green:0 blue:1 alpha:1 ];
    _segcontrol.backgroundColor = [UIColor whiteColor];
    _segcontrol.frame = CGRectMake(100,70, 120, 30);
    _segcontrol.selectedSegmentIndex = 0;
    [_segcontrol addTarget:self action:@selector(segcontrolClick:) forControlEvents:UIControlEventValueChanged];
    [self.view  addSubview:_segcontrol];
    
}

-(void)segcontrolClick:(UISegmentedControl *)segcontrol
{
   
    
    if (segcontrol.selectedSegmentIndex==0)
    {
        [_dataArray removeAllObjects];
        _dataArray = [CommonTools queryCoreData];
        [_collection reloadData];
    }else
    {
        [_dataArray removeAllObjects];
        _dataArray = [CommonTools queryHistoryData];
        [_collection reloadData];
    }
}
#pragma mark----
#pragma 表的布局
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _dataArray.count;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    SubjectModel *object = _dataArray[indexPath.row];
    
    cell.priceLable.text = [NSString stringWithFormat:@"￥%@",object.price];
    cell.priceLable.frame = CGRectMake(0, 120, 100, 30);
 
    [cell.picimage setImageWithURL:[NSURL URLWithString:object.picUrl] placeholderImage:nil];
    cell.picimage.frame = CGRectMake(0, 0, 100, 120);
    cell.picimage.layer.cornerRadius = 5;
    cell.picimage.layer.borderWidth = 1;
    cell.picimage.layer.borderColor = [UIColor grayColor].CGColor;
    cell.picimage.layer.masksToBounds = YES;
    return cell;

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectDetailVC *vc = [[CollectDetailVC alloc]init];
    vc.object = _dataArray[indexPath.row];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
@end
