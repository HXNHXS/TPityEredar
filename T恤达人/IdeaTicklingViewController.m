//
//  IdeaTicklingViewController.m
//  TPityEredar
//
//  Created by mac on 15-7-31.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "IdeaTicklingViewController.h"
#import "MoreTableViewCell.h"
#import "Moremessage.h"

#define Swidth  (self.view.frame.size.width)
#define Sheight  (self.view.frame.size.height)
@interface IdeaTicklingViewController ()<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
{
    UITableView     *_tableView;
    UIImageView     *_changeImageView;
    UIImageView     *_changeImageView1;
    UIImageView     *_changeImageView2;
    NSArray         *_ageArray;
    NSArray         *_sexArray;
    NSArray         *_commentArray;
    UIView          *_inputView ;
    UITextField     *_inputTF;
    NSMutableArray  *_dataArray;
    UIButton        *_ageBtn;
    UIButton        *_sexBtn;
}

@end

@implementation IdeaTicklingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _sexArray = @[@"选择性别",@"男",@"女"];
        _ageArray = @[@"选择年龄",@"0~14岁",@"15~25岁",@"26~30岁",@"31~40岁",@"40~50岁",@"50岁以上"];
        _commentArray = @[@"评价",@"好",@"一般",@"差"];
        _dataArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initView];
    
}

- (void)initView
{
    _changeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, Sheight, Swidth, 250)];
    _changeImageView.backgroundColor = [UIColor whiteColor];
    _changeImageView.userInteractionEnabled = YES;
    [self.view addSubview:_changeImageView];
    
    _changeImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, Sheight, Swidth, 250)];
    _changeImageView1.backgroundColor = [UIColor whiteColor];
    _changeImageView1.userInteractionEnabled = YES;
    [self.view addSubview:_changeImageView1];
    
    _changeImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, Sheight, Swidth, 250)];
    _changeImageView2.backgroundColor = [UIColor whiteColor];
    _changeImageView2.userInteractionEnabled = YES;
    [self.view addSubview:_changeImageView2];

    
    UIImageView *sexAndAgeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, Swidth, 40)];
    sexAndAgeView.backgroundColor = [UIColor whiteColor];
    sexAndAgeView.userInteractionEnabled = YES;
    [self.view addSubview:sexAndAgeView];
    UILabel *sexLB = [[UILabel alloc] initWithFrame:CGRectMake(5, 2, 100, 34)];
    sexLB.text = @"性别/年龄:";
    [sexAndAgeView addSubview:sexLB];
    
    _sexBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _sexBtn.frame = CGRectMake(100, 5, 100, 35);
    [_sexBtn setTitle:@"选择性别" forState:UIControlStateNormal];
    [_sexBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_sexBtn addTarget:self action:@selector(changeSex) forControlEvents:UIControlEventTouchUpInside];
    [sexAndAgeView addSubview:_sexBtn];
    
    _ageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _ageBtn.frame = CGRectMake(200, 5, 100, 35);
    [_ageBtn setTitle:@"选择年龄" forState:UIControlStateNormal];
    [_ageBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_ageBtn addTarget:self action:@selector(changeAge) forControlEvents:UIControlEventTouchUpInside];
    [sexAndAgeView addSubview:_ageBtn];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 110, Swidth, Sheight-90-14-6) style:UITableViewStylePlain];
  
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [_tableView registerClass:[MoreTableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    [self.view addSubview:_tableView];
    
    UIPickerView *sexPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, Swidth, 250)];
    sexPickerView.tag = 2001;
    sexPickerView.delegate = self;
    sexPickerView.dataSource = self;
    [_changeImageView addSubview:sexPickerView];
    
    UIPickerView *agePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, Swidth, 250)];
    agePickerView.tag = 2002;
    agePickerView.delegate = self;
    agePickerView.dataSource = self;
    [_changeImageView1 addSubview:agePickerView];
    
    UIPickerView *commentPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, Swidth, 250)];
    commentPickerView.tag = 2003;
    commentPickerView.delegate = self;
    commentPickerView.dataSource = self;
    [_changeImageView2 addSubview:commentPickerView];
    
    _inputView = [[UIView alloc]initWithFrame:CGRectMake(0, Sheight-44, Swidth, 44)];
    _inputView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_inputView];
    
    _inputTF = [[UITextField alloc]init];
    _inputTF.frame = CGRectMake(40, 4.5, 220, 35);
    _inputTF.borderStyle = UITextBorderStyleRoundedRect;
    [_inputView addSubview:_inputTF];
    _inputTF.delegate = self ;
    
    UIButton *commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    commentButton.frame = CGRectMake(0, 0, 40, 40);
    commentButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [commentButton setTitle:@"评价" forState:UIControlStateNormal];
    [commentButton addTarget:self action:@selector(commentClick) forControlEvents:UIControlEventTouchUpInside];
    [_inputView addSubview:commentButton];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(260, 0, 50, 40);
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(sendButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_inputView addSubview:button];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeBord:) name:UITextInputCurrentInputModeDidChangeNotification object:nil];
    
}

- (void)sendButtonClick
{
    NSString * inputStr = _inputTF.text ;
    
    if ([inputStr isEqualToString:@""])
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"亲爱的上帝别闹，写点东西好不？" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
        return;
    }
    
    Moremessage * object = [[Moremessage alloc]init];
    
    object.message = inputStr;
    [_dataArray addObject:object];
    
    
    NSIndexPath * indexPath = [ NSIndexPath indexPathForRow:_dataArray.count-1 inSection:0];
    NSArray * array = [NSArray arrayWithObjects:indexPath, nil];
    [_tableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationFade];
    
    _inputTF.text = @"";
    
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
}

- (void)commentClick
{
    [self changePicker2];
    [_inputTF resignFirstResponder];
    _tableView.hidden = YES;
    _inputView.frame = CGRectMake(0, Sheight, Swidth, 44);
    [UIView animateWithDuration:1 animations:^{
        _changeImageView2.frame = CGRectMake(0, 240, Swidth, 230);
    } completion:^(BOOL finished) {
        _changeImageView1.frame = CGRectMake(0, Sheight, Swidth, 250);
        _changeImageView.frame = CGRectMake(0, Sheight, 320, 250);
    }];
}

- (void)changeSex
{
    [self changePicker];
    [_inputTF resignFirstResponder];
    _tableView.hidden = YES;
    _inputView.frame = CGRectMake(0, Sheight, Swidth, 44);
    [UIView animateWithDuration:1 animations:^{
        _changeImageView.frame = CGRectMake(0, 240, 320, 230);
    } completion:^(BOOL finished) {
        _changeImageView1.frame = CGRectMake(0, Sheight, 320, 250);
        _changeImageView2.frame = CGRectMake(0, Sheight, 320, 250);
    }];
    
}

- (void)changeAge
{
    [self changePicker1];
    [_inputTF resignFirstResponder];
    _tableView.hidden = YES;
    _inputView.frame = CGRectMake(0, Sheight, Swidth, 44);
    [UIView animateWithDuration:1 animations:^{
        _changeImageView1.frame = CGRectMake(0, 240, Swidth, 230);
    } completion:^(BOOL finished) {
        _changeImageView.frame = CGRectMake(0, Sheight, Swidth, 250);
        _changeImageView2.frame = CGRectMake(0, Sheight, 320, 250);
    }];
}

- (void)changePicker
{
    UIButton *finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    finishBtn.frame = CGRectMake(270, 0, 40, 40);
    [finishBtn setTitle:@"完成" forState:UIControlStateNormal];
    [finishBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [finishBtn addTarget:self action:@selector(finishClick) forControlEvents:UIControlEventTouchUpInside];
    [_changeImageView addSubview:finishBtn];
}

- (void)changePicker1
{
    UIButton *finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    finishBtn.frame = CGRectMake(270, 0, 40, 40);
    [finishBtn setTitle:@"完成" forState:UIControlStateNormal];
    [finishBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [finishBtn addTarget:self action:@selector(finishClick) forControlEvents:UIControlEventTouchUpInside];
    [_changeImageView1 addSubview:finishBtn];
}

- (void)changePicker2
{
    UIButton *finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    finishBtn.frame = CGRectMake(270, 0, 40, 40);
    [finishBtn setTitle:@"完成" forState:UIControlStateNormal];
    [finishBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [finishBtn addTarget:self action:@selector(finishClick) forControlEvents:UIControlEventTouchUpInside];
    [_changeImageView2 addSubview:finishBtn];
}

- (void)finishClick
{
    [UIView animateWithDuration:1 animations:^{
        _changeImageView.Frame = CGRectMake(0, Sheight, Swidth, Sheight/2);
        _changeImageView1.Frame = CGRectMake(0, Sheight, Swidth, Sheight/2);
        _changeImageView2.Frame = CGRectMake(0, Sheight, Swidth, Sheight/2);
        
    } completion:^(BOOL finished) {
        _tableView.hidden = NO;
        _inputView.frame = CGRectMake(0, Sheight-44, Swidth, 44);
    }];
}

#pragma mark --- 判断中英文
- (void)changeBord:(NSNotification *)notification
{
   
    NSString *inputMethod = [[UITextInputMode currentInputMode] primaryLanguage];
    if ([inputMethod isEqualToString:@"zh-Hans"])
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        [UIView setAnimationCurve:7];
        _inputView.center = CGPointMake(160,Sheight-252-22);
        _tableView.frame = CGRectMake(0,110, Swidth, Sheight-90-252-44-14-6);
        [UIView commitAnimations];
    }
    else
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        [UIView setAnimationCurve:7];
        _inputView.center = CGPointMake(160,Sheight-216-22);
        _tableView.frame = CGRectMake(0, 110, Swidth, Sheight-90-216-44-14-6);
        [UIView commitAnimations];
    }
}


#pragma mark  输入框的协议方法
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"shangqu");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:7];
    _inputView.center = CGPointMake(160,Sheight-216-22);
    _tableView.frame = CGRectMake(0, 110, Swidth, Sheight-90-216-44-14-6);
    [UIView commitAnimations];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    
    NSLog(@"xialai ");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:7];
    _inputView.center = CGPointMake(160,Sheight-22);
    _tableView.frame = CGRectMake(0, 110, Swidth, 460-44);
    [UIView commitAnimations];
    return YES;
}
#pragma mark --- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Moremessage *object = _dataArray[indexPath.row];
    
    MoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    CGRect rect = [object.message  boundingRectWithSize:CGSizeMake(150, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:cell.messageLabel.font forKey:NSFontAttributeName] context:nil];
    float height = rect.size.height ;
    float width = self.view.frame.size.width;
    cell.backImageView.frame = CGRectMake(Swidth/2 - 10, 30, Swidth/2 + 10, height+20);
    cell.messageLabel.frame = CGRectMake(width/2 + 10, 35, width/2 - 10, height);
    cell.timeLabel.frame = CGRectMake(width/2 - 50, 10, width/2, 15);
    cell.timeLabel.text = [self getTimeNow];
    cell.messageLabel.text = object.message;
    
    UIImage * oldImage = [UIImage imageNamed:@"bubbleSelf"];
    UIImage * newImage = [oldImage stretchableImageWithLeftCapWidth:22 topCapHeight:15];
    cell.backImageView.image = newImage;
    return cell;
}

#pragma mark --- UITableViewDelegate
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"您好，请您把意见总结一下发给我们，谢谢!!!";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

//设置cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Moremessage * object = _dataArray[indexPath.row];
    
    UIFont * font = [UIFont systemFontOfSize:17];
    
    CGRect rect = [object.message  boundingRectWithSize:CGSizeMake(150, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil];
    return rect.size.height + 50 ;
}


#pragma mark --- UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (pickerView.tag == 2001)
    {
        return _sexArray.count;
    }
    else if (pickerView.tag == 2002)
    {
        return _ageArray.count;
    }
    else
    {
        return _commentArray.count;
    }
}

#pragma mark --- UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView.tag == 2001)
    {
        return _sexArray[row];
    }
    else if (pickerView.tag == 2002)
    {
        return _ageArray[row];
    }
    else
    {
        return _commentArray[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView.tag == 2001)
    {
        NSString *str = _sexArray[row];
        [_sexBtn setTitle:str forState:UIControlStateNormal];
    }
    if (pickerView.tag == 2002)
    {
        NSString *str = _ageArray[row];
        [_ageBtn setTitle:str forState:UIControlStateNormal];
    }
}

- (void)GB
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSString *)getTimeNow
{
    NSString* date;
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    date = [formatter stringFromDate:[NSDate date]];
    NSString *timeNow = [[NSString alloc] initWithFormat:@"%@", date];
    return timeNow;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
