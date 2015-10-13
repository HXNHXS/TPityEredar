//
//  ClassifyViewController.m
//  TPityEredar
//
//  Created by Mac on 15-8-1.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "ClassifyViewController.h"
#import "SPFCell.h"
#import "SPFclassify.h"
#import "ClassDetailsVC.h"
@interface ClassifyViewController ()

@end

@implementation ClassifyViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"分类";
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    content_array = [[NSMutableArray alloc]init];
    [self.view addSubview:_tableView];
    
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;  //分割线
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    
    [_tableView registerClass:[SPFCell class] forCellReuseIdentifier:@"cell"];
    _classifyArray = [[NSMutableArray alloc] initWithCapacity:12];
    
    
    [NetWorkRequest requestClassifyListWithCompletion:^(NSDictionary * dic){
        
        content_array=[dic objectForKey:@"content"];
        
        for (NSDictionary *newsDic in content_array)
        {
            SPFclassify *classify = [[SPFclassify alloc] initWithDictionary:newsDic];
            
            
            [_classifyArray addObject:classify];
            
            
        }
        [_tableView reloadData];
    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SPFclassify *classify = [_classifyArray objectAtIndex:indexPath.row];
    
    
    
    SPFCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.nameLabel.text=classify.name;
    
    
    NSArray *arr = [content_array[indexPath.row] objectForKey:@"products"];
    
    
    
    
    for (int i = 0; i<3; i++) {
        NSString *urlstr = [[arr objectAtIndex:indexPath.section+i] objectForKey:@"picUrl"];
        
        UIImageView *imgView = [cell.array objectAtIndex:i];
        
        [imgView setImageWithURL:[NSURL URLWithString:urlstr]];
        
    }
    
    
    
    
    return cell;
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return _classifyArray.count;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ClassDetailsVC * vc=[[ClassDetailsVC alloc]init];
    SPFclassify *object =_classifyArray[indexPath.row];
    vc.object =object;
    
    
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
