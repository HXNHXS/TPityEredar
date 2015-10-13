//
//  MoreViewController.m
//  TPityEredar
//
//  Created by mac on 15-7-29.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "MoreViewController.h"

#import "UIWindow+YzdHUD.h"

#import "IdeaTicklingViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"更多";
    
        // 设置样式 让 section 不跟着 tableView 滑动而滚动
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
}
#pragma mark - 返回区头高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
        // 设置统一的 区头高度
    return 30;
}
#pragma mark - 返回区
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
#pragma mark - 返回每个区 多少行
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else if (section == 1){
        return 2;
    }else {
        return 1;
    }
}
#pragma mark - cell
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//TODO:第一区
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        } if (indexPath.row == 0) {
            cell.textLabel.text = @"给我们评价";
                // 点击cell的样式
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
                // 右边的大于号
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else{
            cell.textLabel.text = @"意见反馈";
            // 点击cell的样式
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
             // 右边的大于号
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return cell;
    }
//TODO:第二区
    else if (indexPath.section == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell2"];
        }
        if (indexPath.row == 0) {
            cell.textLabel.text = @"检查更新";
            // 点击cell的样式
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
             // 右边的大于号
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else{
            cell.textLabel.text = @"清空缓存";
            // 点击cell的样式
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
             // 右边的大于号
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return cell;
    }
//TODO:第三区
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3"];
        }
        cell.textLabel.text = @"精品推荐";
        // 点击cell的样式
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
#pragma mark - 点击某一行cell的时候
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//TODO:第一区
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
        // 跳转到App Store 给我们评价
            
        }else{
                // 意见反馈
            IdeaTicklingViewController *idearTicklingVC = [[IdeaTicklingViewController alloc] init];
            idearTicklingVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:idearTicklingVC animated:YES];
        }
    }
//TODO:第二区
    else if (indexPath.section == 1){
        if (indexPath.row == 0) {
                // 检查版本更新
            [APP_WINDOW showHUDWithText:@"已经是最新版本" Type:ShowPhotoYes Enabled:YES];
        }else{
                // 清空缓存
            UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"清除缓存?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
            sheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
            [sheet showInView:self.view];
        }
    }
//TODO:第三区
    else{
            // 精品推荐
    }
}
#pragma mark - UIActionSheetDelegate
- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        
        
       
        [APP_WINDOW showHUDWithText:@"清除成功" Type:ShowPhotoYes Enabled:YES];
        
        //清楚 数据库数据
        [CommonTools deleteEntityCoreData];
        [CommonTools deleteHistoryCoreData];
    }else{
        
    }
}
@end
