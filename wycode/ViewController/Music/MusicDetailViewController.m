//
//  MusicDetailViewController.m
//  wycode
//
//  Created by wangyu on 16/2/25.
//  Copyright © 2016年 wangyu. All rights reserved.
//

#import "MusicDetailViewController.h"
#import "WyResult.h"
#import "SVProgressHUD.h"

@interface MusicDetailViewController ()<UIWebViewDelegate>
@property(weak, nonatomic) IBOutlet UIWebView *web;

@end

@implementation MusicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_web setDelegate:self];

    //加载网页的方式
    //1.创建并加载远程网页
    NSURL *url = [NSURL URLWithString:_entity.url];
    [_web loadRequest:[NSURLRequest requestWithURL:url]];
    [SVProgressHUD show];
    //2.加载本地文件资源
    /* NSURL *url = [NSURL fileURLWithPath:filePath];
   NSURLRequest *request = [NSURLRequest requestWithURL:url];
   [webView loadRequest:request];*/
    //3.读入一个HTML，直接写入一个HTML代码
    //NSString *htmlPath = [[[NSBundle mainBundle]bundlePath]stringByAppendingString:@"webapp/loadar.html"];
    //NSString *htmlString = [NSString stringWithContentsOfURL:htmlPath encoding:NSUTF8StringEncoding error:NULL];
    //[webView loadHTMLString:htmlString baseURL:[NSURL fileURLWithPath:htmlPath]];
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [SVProgressHUD dismiss];
}

@end
