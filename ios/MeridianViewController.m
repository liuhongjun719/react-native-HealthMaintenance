//
//  MeridianViewController.m
//  HealthMaintenance
//
//  Created by 123456 on 16/8/1.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "MeridianViewController.h"
#import "RCTBundleURLProvider.h"
#import "RCTRootView.h"
#import "SWRevealViewController.h"
#import "RNRequest.h"

@interface MeridianViewController ()

@end

@implementation MeridianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  SWRevealViewController *revealController = [self revealViewController];
  
  [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
  UIButton *leftBurron = [UIButton buttonWithType:UIButtonTypeCustom];
  leftBurron.frame = CGRectMake(0, 0, 20, 20);
  [leftBurron addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
  [leftBurron setBackgroundImage:[UIImage imageNamed:@"reveal-icon.png"] forState:UIControlStateNormal];
  UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBurron];
  self.navigationItem.leftBarButtonItem = revealButtonItem;
  
  
  
  self.view = [[RNRequest alloc] getRootView:@{
                                               @"url":@"http://www.idwoo.net/api/zyys/get_category_posts/?id=706&page=0&dev=1",
                                               @"type":@"1"

                                               }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
