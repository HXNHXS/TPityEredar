//
//  NetWorkRequest.m
//  TPityEredar
//
//  Created by Mac on 15-7-28.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "NetWorkRequest.h"

@implementation NetWorkRequest

+(void)getRecommendCompletion:(void(^)(NSDictionary *dic))block
{
  
    AFHTTPRequestOperationManager *request = [AFHTTPRequestOperationManager manager];
    [request GET:@"http://wear.motoway.net/app/subjects/2/recommend"parameters:(nil)  success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSDictionary *dic = (NSDictionary *)responseObject;
        
                if (block)
        {
            block(dic[@"content"][0]);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"---%@",error);
    }];
    
}

+(void)getSubjectDataCompletion:(void(^)(NSDictionary *dic))block
{
    AFHTTPRequestOperationManager *request = [AFHTTPRequestOperationManager manager];
    [request GET:@"http://wear.motoway.net/app/subjects/2?data=%7B%22n%22%3A20%2C%22s%22%3A0%7D"parameters:(nil)  success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSDictionary *dic = (NSDictionary *)responseObject;
         
         if (block)
         {
             block(dic);
         }
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"---%@",error);
     }];
}
+(void)getDetailSubjectDataWithString:(NSString *)url Completion:(void(^)(NSDictionary *dic))block
{
    NSString *str = [NSString stringWithFormat:@"http://wear.motoway.net/app/subject/%@",url];
    AFHTTPRequestOperationManager *request = [AFHTTPRequestOperationManager manager];
    [request GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSDictionary *dic = (NSDictionary *)responseObject;
        if (block)
        {
            block(dic);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"%@",error);
    }];
}
+(void)getSubjectDataOneCompletion:(void(^)(NSDictionary *dic))block
{
    AFHTTPRequestOperationManager *request = [AFHTTPRequestOperationManager manager];
    [request GET:@"http://wear.motoway.net/app/subjects/2?data=%7B%22n%22%3A40%2C%22s%22%3A20%7D" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSDictionary *dic = (NSDictionary *)responseObject;
        if (block)
        {
            block(dic);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

+(void)getSubjectDataTwoCompletion:(void(^)(NSDictionary *dic))block
{
    AFHTTPRequestOperationManager *request = [AFHTTPRequestOperationManager manager];
    [request GET:@"http://wear.motoway.net/app/subjects/2?data=%7B%22n%22%3A60%2C%22s%22%3A40%7D" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSDictionary *dic = (NSDictionary *)responseObject;
         if (block)
         {
             block(dic);
         }
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@",error);
     }];
}










+ (void)requestClassifyListWithCompletion:(void (^)(NSDictionary *dic))block
{
    
    AFHTTPRequestOperationManager * manager=[AFHTTPRequestOperationManager manager];
    [manager GET:@"http://wear.motoway.net/app/labels/2"parameters:(nil)  success:^(AFHTTPRequestOperation *operation, id responseObject)
     
     {
         NSDictionary *dic = (NSDictionary *)responseObject;
         
         
         if (block)
         {
             block(dic);
         }
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"---%@",error);
     }];
    
    
}


+ (void)requestDetailClassifyListWithlabelld:(int )labelld  Completion:(void (^)(NSDictionary *dic))block
{
    
    NSString *strurl = [NSString stringWithFormat:@"http://wear.motoway.net/app/products/2/%d%@",labelld,@"?data=%7B%22n%22%3A20%2C%22s%22%3A0%7D"];
    
    AFHTTPRequestOperationManager *request = [AFHTTPRequestOperationManager manager];
    request.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    [request GET:strurl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSDictionary *dic = (NSDictionary *)responseObject;
         
         if (block)
         {
             block(dic);
         }
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@",error);
     }];
}

+ (void) getHotPageCompletion:(void(^)(NSDictionary *dic))block{
    
    //    NSString *urlString = [NSString stringWithFormat:@"http://wear.motoway.net/app/products/2?data=%7B%22n%22%3A20%2C%22s%22%3A0%7D"];
    
    
    AFHTTPRequestOperationManager *request = [AFHTTPRequestOperationManager manager];
    
    [request GET:@"http://wear.motoway.net/app/products/2?data=%7B%22n%22%3A20%2C%22s%22%3A0%7D" parameters:(nil)
         success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSDictionary *dic = (NSDictionary *)responseObject;
         if (block)
         {
             block(dic);
         }
     }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"---%@",error);
     }];
}














//+(void)getDtaRecommendCompletion:(void(^)(NSDictionary *dic))block
//{
//    
//    //request.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html;charset=UTF-8"];
//    
//    NSString *url =@"http://appcms.m2lux.com/interface/GetArticle.php?categoryId=20&isPad=0&count=10";
//    //NSString * encode = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)url, NULL, NULL, kCFStringEncodingUTF8));
//    //NSString * encodedString = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)url, NULL, NULL,  kCFStringEncodingUTF8 );
//    
//    //系统自动管理你的请求队列
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
//    //如果报文报content－type错误修改content－type即可。
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
//     {
//         //NSLog(@"responseObject====%@",responseObject);
//         
//         NSArray *arry= (NSArray *)responseObject;
//        
//        
//         NSLog(@"%@", arry[0][@"title"]);
//        
//         
//     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//         NSLog(@"%@",error);
//     }];
//
//    
////    
////    NSString *urlStr = @"http://appcms.m2lux.com/interface/GetArticle.php?categoryId=21&page=3&isPad=0&count=10";
////    
////    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
////    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
////    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
////        NSLog(@"1--------%@",operation.responseString);
////        //NSArray *array = responseObject;
////        //if (block) {
////        //    block(array);
////        //}
////    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
////        NSLog(@"2————%@",error);
////    }];
////    
////    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//}






@end
