//
//  ClassVC.m
//  TPityEredar
//
//  Created by Mac on 15-8-1.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "ClassDetailsVC.h"
#import "SPFclassify.h"
#import "MyCell.h"
#import "singletonVC.h"
@interface ClassDetailsVC ()

@end

@implementation ClassDetailsVC



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _array=[[NSMutableArray alloc]init];
    self.title=self.object.name;
    
    self.view.backgroundColor=[UIColor whiteColor];//防止BUG  卡顿
    
    
    [NetWorkRequest requestDetailClassifyListWithlabelld:[self.object.labelld intValue] Completion:^(NSDictionary *dic)
     {
         for (int i = 0; i<[dic[@"result"] count]; i++)
         {
             NSDictionary *adic = dic[@"result"][i];
             SPFclassify *object = [[SPFclassify alloc]initWithDictionary:adic];
             [_array addObject:object];
             [_collectionView reloadData];
         }
         
         
         
     }];
    
    
    
    //    创建一个UICollectionViewFlowLayout,系统提供的一个表格布局(继承UICollectionViewLayout)
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    //    设置单元格大小
    layout.itemSize=CGSizeMake(275/2, 220);
    //    设置行间距
    layout.minimumLineSpacing=15;
    //    设置列间距(设置的列间距是最小列间距,要保证列与列之间的距离相等,两边必须在边缘)
    layout.minimumInteritemSpacing=15;
    //设置滑动方向UICollectionViewScrollDirectionHorizontal左右滑动(默认上下滑动)
    //    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    //    设置上下左右距离边界的长度
    layout.sectionInset=UIEdgeInsetsMake(15, 15, 15, 15);//上 左 下 右
    
    //    collectionView必须指定一种布局方式,第二个参数就是
    
	_collectionView =[[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    //    UICollectionView默认颜色为黑色
    _collectionView.backgroundColor=[UIColor whiteColor];
    //    设置数据源与代理
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    //    注册自定义cell
    [_collectionView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    SPFclassify *object = _array[indexPath.row];
    
    
    [cell.imageButton setBackgroundImageWithURL:[NSURL URLWithString:object.bigPicUrl] placeholderImage:nil];
    
    cell.titleLabel.text=object.countLike;
    cell.oneTabel.textColor=[UIColor redColor];
    cell.oneTabel.text = object.price;
    cell.twoLabel.text=@"￥";
    cell.twoLabel.textColor=[UIColor redColor];
    cell. img.image=[UIImage imageNamed:@"like2@2x.png"];
    
    
    
    return  cell;
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    singletonVC * vc=[[singletonVC alloc]init];
   SPFclassify *object =_array[indexPath.row];
    vc.obj = object;
   
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
