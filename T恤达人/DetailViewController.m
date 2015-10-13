//
//  DetailViewController.m
//  TPityEredar
//
//  Created by Mac on 15-7-28.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title =self.object.name;
    self.view.backgroundColor = [UIColor cyanColor];
    _dataArray = [NSMutableArray array];
    
    //获取数据源
    [NetWorkRequest getDetailSubjectDataWithString:self.object.ID Completion:^(NSDictionary *dic) {
        
        for (int i = 0; i<[dic[@"content"][@"products"] count]; i++)
        {
            NSDictionary *adic =dic[@"content"][@"products"][i];
            SubjectModel *object = [[SubjectModel alloc]initWithDictionary:adic];
            [_dataArray addObject:object];
            
            [_tableView reloadData];
        }
       
    }];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.rowHeight = 250;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = 0;
    [self.view addSubview:_tableView];
    
}

#pragma mark----
#pragma mark 表的布局
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SubjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[SubjectTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = 0;
        
    }
    SubjectModel *object = _dataArray[indexPath.row];
    
    //图片
    [cell.picimage setImageWithURL:[NSURL URLWithString:object.picUrl] placeholderImage:nil];
    cell.picimage.frame = CGRectMake(40, 5, self.view.frame.size.width-80, 160);
    //背景
    [cell.xiangqingimage setImage:[UIImage imageNamed:@"xiangqing_bg"]];
    cell.xiangqingimage.frame  =CGRectMake(38, 165, self.view.frame.size.width-76, 80);
    
   
    cell.countLikeButton.tag = indexPath.row;
    [cell.countLikeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.countLikeButton.frame = CGRectMake(45, 213, 20, 20  );
    //收藏数量lable
    cell.countLikeLable.font = [UIFont systemFontOfSize:12];
    cell.countLikeLable.text = object.countLike;
    cell.countLikeLable.frame = CGRectMake(70, 220, 30, 10);
    cell.countLikeLable.textColor = [UIColor grayColor];
    //简介lable
    cell.productslable.text = object.title;
    cell.productslable.font = [UIFont systemFontOfSize:14];
    cell.productslable.frame = CGRectMake(45, 165, self.view.frame.size.width-90, 40);
    //简介背景
    [cell.productsimage setImage:[UIImage imageNamed:@"line3"]];
    cell.productsimage.frame = CGRectMake(40, 205, self.view.frame.size.width-80, 1);
    //分享按钮
    [cell.shareButton setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    cell.shareButton.tag=indexPath.row;
    [cell.shareButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.shareButton.frame = CGRectMake(150, 213, 18, 18);
    //淘宝详情按钮
    [cell.taobaoButton setBackgroundImage:[UIImage imageNamed:@"taobao"] forState:UIControlStateNormal];
    cell.taobaoButton.tag = indexPath.row;
     [cell.taobaoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.taobaoButton.frame = CGRectMake(200, 213,70, 20);
    //收藏按钮的状态
    [cell.countLikeButton setBackgroundImage:[UIImage imageNamed:@"like_people"] forState:UIControlStateNormal];
    cell.countLikeButton.userInteractionEnabled = YES;
    //判断宝贝是否收藏如果收藏改变收藏按钮 的状态
    for (SubjectModel  *model in [CommonTools queryCoreData])
    {
        if ([model.title isEqualToString:object.title])
        {
            [cell.countLikeButton setBackgroundImage:[UIImage imageNamed:@"like2_focus"] forState:UIControlStateNormal];
            cell.countLikeButton.userInteractionEnabled = NO;
        }
    }
   
    return cell;
}

-(void)buttonClick:(UIButton  *)button
{
    
   SubjectModel *object = _dataArray[button.tag];
    
    if ([button.titleLabel.text isEqual:@"收藏"])
    {
        button.userInteractionEnabled = NO;
        [button setBackgroundImage:[UIImage imageNamed:@"like2_focus"] forState:UIControlStateNormal];
      
        //把收藏的宝贝存入数据库
        
        SubjectModel *object = _dataArray[button.tag];
       
        [CommonTools insertCoreDataWithTitle:object.title Countlike:object.countLike PicUrl:object.picUrl TaobaoUrl:object.taobaoUrl Price:object.price];
    }
    
    if ([button.titleLabel.text isEqual:@"分享"])
    {
        [UMSocialSnsService presentSnsIconSheetView:self appKey:@"55ba2940e0f55af3c20026d8" shareText:object.title shareImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:object.picUrl]]] shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToDouban,nil] delegate:nil];
    
    }
    if ([button.titleLabel.text isEqual:@"淘宝"])
    {
        
        WebViewController *webvc = [[WebViewController alloc]init];
        webvc.object = _dataArray[button.tag];
        
        [self.navigationController pushViewController:webvc animated:YES];
        //判断历史数据库是否有数据如果没有则存入历史数据库
          SubjectModel *object = _dataArray[button.tag];
        for (SubjectModel  *model in [CommonTools queryHistoryData])
        {
            if ([model.title isEqualToString:object.title])
            {
                return;
            }
        }
        
        //存入历史数据库
        [CommonTools insertHistoryDataWithTitle:object.title Countlike:object.countLike PicUrl:object.picUrl TaobaoUrl:object.taobaoUrl Price:object.price];

    }
}


@end
