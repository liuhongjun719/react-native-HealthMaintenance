//
//  OCInvokeRNDetailViewController.m
//  HealthMaintenance
//
//  Created by 123456 on 16/8/2.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "OCInvokeRNDetailViewController.h"

#define kRGB(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface OCInvokeRNDetailViewController ()

@end

@implementation OCInvokeRNDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  self.view.backgroundColor = [UIColor purpleColor];
  self.navigationController.navigationBar.barTintColor = kRGB(18, 172, 233, 1.0);
  [self setEdgesForExtendedLayout:UIRectEdgeNone];
  self.title = @"OC调用RN详情界面";
  self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor whiteColor],
                                                                  UITextAttributeFont : [UIFont boldSystemFontOfSize:18]};
  
  
  UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(popViewController)];
  self.navigationItem.leftBarButtonItem = backBarButton;
  
}

- (void)popViewController {
  [self dismissViewControllerAnimated:YES completion:nil];
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
