//
//  ViewController.m
//  TPityEredar
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "ViewController.h"

#import "HotViewController.h"

#import "SubjectViewController.h"

#import "ClassifyViewController.h"

#import "CollectViewController.h"

#import "MoreViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITabBarController *tab = [[UITabBarController alloc] init];
    
    tab.tabBar.tintColor = [UIColor colorWithRed:.85 green:0 blue:.85 alpha:1];
    
    HotViewController *hot = [[HotViewController alloc] init];
    UINavigationController *hotNav = [[UINavigationController alloc] initWithRootViewController:hot];
    hotNav.tabBarItem.title = @"热门";
    hotNav.tabBarItem.image = [UIImage imageNamed:@"tab1@2x.png"];
    
    SubjectViewController *sub = [[SubjectViewController alloc] init];
    UINavigationController *subNav = [[UINavigationController alloc] initWithRootViewController:sub];
    subNav.tabBarItem.title = @"主题";
    subNav.tabBarItem.image = [UIImage imageNamed:@"tab2@2x.png"];
    
    ClassifyViewController *class = [[ClassifyViewController alloc] init];
    UINavigationController *classNav = [[UINavigationController alloc] initWithRootViewController:class];
    classNav.tabBarItem.title = @"分类";
    classNav.tabBarItem.image = [UIImage imageNamed:@"tab3@2x.png"];
    
    CollectViewController *collect = [[CollectViewController alloc] init];
    UINavigationController *collectNav = [[UINavigationController alloc] initWithRootViewController:collect];
    collectNav.tabBarItem.title = @"收藏";
    collectNav.tabBarItem.image = [UIImage imageNamed:@"tab4@2x.png"];
    
    MoreViewController *more = [[MoreViewController alloc] init];
    UINavigationController *moreNav = [[UINavigationController alloc] initWithRootViewController:more];
    moreNav.tabBarItem.title = @"更多";
    moreNav.tabBarItem.image = [UIImage imageNamed:@"tab5@2x.png"];
    
    tab.viewControllers = @[hotNav,subNav,classNav,collectNav,moreNav];
    
    [[[UIApplication sharedApplication] delegate] window]. rootViewController = tab;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
