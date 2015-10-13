//
//  singletonVC.m
//  TPityEredar
//
//  Created by Mac on 15-8-1.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "singletonVC.h"
#import "WebViewController.h"
@interface singletonVC ()

@end

@implementation singletonVC

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    self.title = @"详情";
    //图片
    self.view.backgroundColor=[UIColor whiteColor];
    
    // 调用
    [self creatDetailsViewController];
}

- (void) creatDetailsViewController{
    //TODO: 大图片
    _bigPicImageView = [[UIImageView alloc] init];
    
    _bigPicImageView.frame = CGRectMake(50.0f, 64.0f, self.view.frame.size.width - 100, 250);
    
    
    
    [_bigPicImageView setImageWithURL:[NSURL URLWithString:self.obj.bigPicUrl]];
    
    [self.view addSubview:_bigPicImageView];
    //TODO:名字Label
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.numberOfLines = 0;
    _nameLabel.text = self.obj.title;
    _nameLabel.font = [UIFont systemFontOfSize:12.0f];
    _nameLabel.frame = CGRectMake(20, _bigPicImageView.frame.size.height + 64.0f + 30 , 200, 60);
    [self.view addSubview:_nameLabel];
    //TODO:人民币符号Label
    _moneyLabel = [[UILabel alloc] init];
    _moneyLabel.text = @"￥";
    _moneyLabel.textAlignment = NSTextAlignmentCenter;
    _moneyLabel.textColor = [UIColor colorWithRed:254.0/255.0f green:73.0/255.0f blue:220.0/255.0f alpha:1];
    _moneyLabel.font = [UIFont systemFontOfSize:20.0f];
    _moneyLabel.frame = CGRectMake(20, _bigPicImageView.frame.size.height + 64.0f + 30+ _nameLabel.frame.size.height + 20 + 2 + 10, 20, 20);
    [self.view addSubview:_moneyLabel];
    //TODO:价钱Label
    _priceLabel = [[UILabel alloc] init];
    _priceLabel.frame = CGRectMake(20 + _moneyLabel.frame.size.width, _bigPicImageView.frame.size.height + 64.0f + 30+ _nameLabel.frame.size.height + 30, 80, 20);
    _priceLabel.textColor = [UIColor colorWithRed:254.0/255.0f green:73.0/255.0f blue:220.0/255.0f alpha:1];
    _priceLabel.text = self.obj.price;
    [self.view addSubview:_priceLabel];
    //TODO:横线
    _acrossLineImageView = [[UIImageView alloc] init];
    float y = _bigPicImageView.frame.size.height + 64.0f + 30+ _nameLabel.frame.size.height + 20 + _priceLabel.frame.size.height + 30;
    _acrossLineImageView.frame = CGRectMake(0, y,  self.view.frame.size.width, 2);
    _acrossLineImageView.image = [UIImage imageNamed:@"line3"];
    [self.view addSubview:_acrossLineImageView];
    //TODO:竖线
    _uprightLineImageView = [[UIImageView alloc] init];
    _uprightLineImageView.frame = CGRectMake(20 + _nameLabel.frame.size.width + 20, _bigPicImageView.frame.size.height + 64.0f + 20, 2, 130);
    _uprightLineImageView.image = [UIImage imageNamed:@"line1"];
    [self.view addSubview:_uprightLineImageView];
    //TODO:心形Button
    _heartButton = [UIButton buttonWithType:UIButtonTypeSystem];
    float x = 20 + _nameLabel.frame.size.width + 20 + _uprightLineImageView.frame.size.width + 10 + 10;
    float heartY = _bigPicImageView.frame.size.height + 64.0f + 30.0f ;
    _heartButton.frame = CGRectMake(x + 3, heartY, 20, 20);
    [_heartButton setBackgroundImage:[UIImage imageNamed:@"like_people"] forState:UIControlStateNormal];

    [_heartButton addTarget:self action:@selector(heartButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    //判断宝贝是否收藏如果收藏改变收藏按钮 的状态
    for (SubjectModel  *model in [CommonTools queryCoreData])
    {
        if ([model.title isEqualToString:self.obj.title])
        {
            [_heartButton setBackgroundImage:[UIImage imageNamed:@"like2_focus"] forState:UIControlStateNormal];
            _heartButton.userInteractionEnabled = NO;
        }
    }

    [self.view addSubview:_heartButton];
    //TODO:喜欢Label
    _loveLabel = [[UILabel alloc] init];
    _loveLabel.text = @"喜欢";
    _loveLabel.textAlignment = NSTextAlignmentLeft;
    _loveLabel.font = [UIFont systemFontOfSize:15.0f];
    _loveLabel.frame = CGRectMake(x , heartY + _heartButton.frame.size.height + 5, 30, 20);
    _loveLabel.textColor = [UIColor blackColor];
    [self.view addSubview:_loveLabel];
    //TODO:分享按钮
    _shareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _shareButton.frame = CGRectMake(x + 3, heartY + _heartButton.frame.size.height + 5 + _loveLabel.frame.size.height + 10 + 10, 20, 20);
    [_shareButton setBackgroundImage:[UIImage imageNamed:@"share@2x"] forState:UIControlStateNormal];
    [_shareButton addTarget:self action:@selector(shareButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_shareButton];
    //TODO:分享Label
    _shareLabel = [[UILabel alloc] init];
    _shareLabel.frame = CGRectMake(x, heartY + _heartButton.frame.size.height + 5 + _loveLabel.frame.size.height + _shareButton.frame.size.height + 20 + 5 , 30, 20);
    _shareLabel.font = [UIFont systemFontOfSize:15.0f];
    _shareLabel.textAlignment = NSTextAlignmentLeft;
    _shareLabel.textColor = [UIColor blackColor];
    _shareLabel.text = @"分享";
    [self.view addSubview:_shareLabel];
    //TODO:收藏图片
    _collectImageView = [[UIImageView alloc] init];
    float collectX = 20;
    float collectY = 64.0f + _bigPicImageView.frame.size.height + 30 + _nameLabel.frame.size.height + 30 + _priceLabel.frame.size.height + 30 + _acrossLineImageView.frame.size.height + 10 + 10;
    _collectImageView.frame = CGRectMake(collectX, collectY, 14, 12);
    _collectImageView.image = [UIImage imageNamed:@"like_people@2x"];
    [self.view addSubview:_collectImageView];
    //TODO:收藏数字Label
    _collectFigureLabel = [[UILabel alloc] init];
    _collectFigureLabel.frame = CGRectMake(collectX + _collectImageView.frame.size.width + 3, collectY - 5, 30, 20);
    _collectFigureLabel.font = [UIFont systemFontOfSize:12.0f];
    _collectFigureLabel.textAlignment = NSTextAlignmentCenter;
    _collectFigureLabel.text = self.obj.countLike;
    _collectFigureLabel.textColor = [UIColor colorWithRed:254.0/255.0f green:73.0/255.0f blue:220.0/255.0f alpha:1];

    [self.view addSubview:_collectFigureLabel];
    //TODO:Label
    _label = [[UILabel alloc] init];
    _label.textColor = [UIColor grayColor];
    _label.text = @"人喜欢";
    _label.font = [UIFont systemFontOfSize:12.0f];
    _label.frame = CGRectMake(collectX + _collectImageView.frame.size.width + 3 + _collectFigureLabel.frame.size.width, collectY - 5, 40, 20);
    [self.view addSubview:_label];
    //TODO:淘宝详情Button
    _taoBaoDetailsButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_taoBaoDetailsButton setBackgroundImage:[UIImage imageNamed:@"taobao@2x"] forState:UIControlStateNormal];
    [_taoBaoDetailsButton addTarget:self action:@selector(taoBaoDetailsButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    float taoBaoX = 20 + _nameLabel.frame.size.width - 30;
    float taoBaoY = 64.0f + _bigPicImageView.frame.size.height + 30 + _nameLabel.frame.size.height + 30 + _priceLabel.frame.size.height + 30 + _acrossLineImageView.frame.size.height + 10;
    _taoBaoDetailsButton.frame = CGRectMake(taoBaoX, taoBaoY, 120, 40);
    [self.view addSubview:_taoBaoDetailsButton];
}
#pragma mark - 喜欢
- (void) heartButtonClicked:(UIButton *)button{
    
    
    [_heartButton setBackgroundImage:[UIImage imageNamed:@"like2_focus"] forState:UIControlStateNormal];
    
    //改变交互性
    button.userInteractionEnabled = NO;
    //存到收藏数据库
    [CommonTools insertCoreDataWithTitle:self.obj.title Countlike:self.obj.countLike PicUrl:self.obj.picUrl TaobaoUrl:self.obj.taobaoUrl Price:self.obj.price];
    
}
#pragma mark - 分享
- (void) shareButtonClicked:(UIButton *)button{
    
    [UMSocialSnsService presentSnsIconSheetView:self appKey:@"55ba2940e0f55af3c20026d8" shareText:self.obj.title shareImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.obj.picUrl]]] shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToDouban,nil] delegate:nil];
    
}
#pragma mark - 淘宝详情
- (void) taoBaoDetailsButtonClicked:(UIButton *)button{
    
    WebViewController *taoBaoVC = [[WebViewController alloc] init];
    SubjectModel *object = [[SubjectModel alloc]init];
    //判断历史数据库是否有数据如果没有则存入历史数据库
    for (SubjectModel  *model in [CommonTools queryHistoryData])
    {
        if ([model.title isEqualToString:self.obj.title])
        {
            // 传值
            taoBaoVC.object = model;
            // 隐藏tabar
            taoBaoVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:taoBaoVC animated:YES];
            return;
        }
    }
    
    
    object.taobaoUrl = self.obj.taobaoUrl;
    taoBaoVC.object = object;
    //存入历史数据库
    [CommonTools insertHistoryDataWithTitle:self.obj.title Countlike:self.obj.countLike PicUrl:self.obj.picUrl TaobaoUrl:self.obj.taobaoUrl Price:self.obj.price];

    [self.navigationController pushViewController:taoBaoVC animated:YES];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
