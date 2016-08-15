//
//  RNInvokeOCDetailViewController.m
//  HealthMaintenance
//
//  Created by 123456 on 16/8/2.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RNInvokeOCDetailViewController.h"
#import "AFNetworking.h"
#import "OCInvokeRNDetailViewController.h"

#define kRGB(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
@interface RNInvokeOCDetailViewController ()
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation RNInvokeOCDetailViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.view.backgroundColor = [UIColor purpleColor];
  self.navigationController.navigationBar.barTintColor = kRGB(18, 172, 233, 1.0);
  [self setEdgesForExtendedLayout:UIRectEdgeNone];
  self.title = @"RN调用OC详情界面";
  self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor whiteColor],
                                                                  UITextAttributeFont : [UIFont boldSystemFontOfSize:18]};
  
  UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(popViewController)];
  self.navigationItem.leftBarButtonItem = backBarButton;
  
  
  
  self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
  [self.view addSubview:self.webView];
  
  [self requestData];
//  [self setRightButton];

}

#pragma mark- RN --->OC  RN 调用 OC
- (void)popViewController {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)requestData {
  NSString *urlUTF8 = [[self.contentDictionary objectForKey:@"url"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  
  AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
  AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
  securityPolicy.allowInvalidCertificates = YES;
  securityPolicy.validatesDomainName = NO;
  
  manager.securityPolicy = securityPolicy;
  
  [manager.requestSerializer setTimeoutInterval:30.0];
  
  [manager GET:urlUTF8 parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    
  } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    responseObject = (NSDictionary*)responseObject;
    NSDictionary *postDic = [responseObject objectForKey:@"post"];
    NSString *content = [postDic objectForKey:@"content"];
    NSLog(@"content-----:%@", content);
    [self.webView loadHTMLString:content baseURL:nil];
    
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
  }];
}

#pragma mark- OC --> RN  OC 调用 RN
- (void)setRightButton {
  UIButton *leftBurron = [UIButton buttonWithType:UIButtonTypeCustom];
  leftBurron.frame = CGRectMake(0, 0, 10, 20);
  [leftBurron addTarget:self action:@selector(showOCInvokeRNController) forControlEvents:UIControlEventTouchUpInside];
  [leftBurron setBackgroundImage:[UIImage imageNamed:@"indicator_right"] forState:UIControlStateNormal];
  UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBurron];
  self.navigationItem.rightBarButtonItem = revealButtonItem;
}
#pragma mark 将OC界面中的数据传到RN的界面，并显示出来
- (void)showOCInvokeRNController {
  OCInvokeRNDetailViewController *detailViewController = [[OCInvokeRNDetailViewController alloc] init];
  UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
  [self presentViewController:navigationController animated:YES completion:nil];
}


@end
