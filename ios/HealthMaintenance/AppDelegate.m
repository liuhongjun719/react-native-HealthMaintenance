/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"

#import "RCTBundleURLProvider.h"
#import "RCTRootView.h"

#import "SWRevealViewController.h"
#import "FrontViewController.h"
#import "RearViewController.h"


#define kRGB(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface AppDelegate()<SWRevealViewControllerDelegate>
@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//  NSURL *jsCodeLocation;
//
////  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];
//    jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios&dev=false"];
//
//  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
//                                                      moduleName:@"HealthMaintenance"
//                                               initialProperties:nil
//                                                   launchOptions:launchOptions];
//  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];

//  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//  UIViewController *rootViewController = [UIViewController new];
//  rootViewController.view = rootView;
//  self.window.rootViewController = rootViewController;
//  [self.window makeKeyAndVisible];
//  return YES;
//  
  
  UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window = window;
  
  FrontViewController *frontViewController = [[FrontViewController alloc] init];
  RearViewController *rearViewController = [[RearViewController alloc] init];
//  frontViewController.view = rootView;
  
  UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
  UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:rearViewController];
  frontNavigationController.navigationBar.barTintColor = kRGB(18, 172, 233, 1.0);
  rearNavigationController.navigationBar.barTintColor = kRGB(18, 172, 233, 1.0);

  
  SWRevealViewController *mainRevealController = [[SWRevealViewController alloc]
                                                  initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
  
  mainRevealController.delegate = self;
  
  self.viewController = mainRevealController;
  
  self.window.rootViewController = self.viewController;
  [self.window makeKeyAndVisible];
  return YES;
}
- (NSString*)stringFromFrontViewPosition:(FrontViewPosition)position
{
  NSString *str = nil;
  if ( position == FrontViewPositionLeft ) str = @"FrontViewPositionLeft";
  if ( position == FrontViewPositionRight ) str = @"FrontViewPositionRight";
  if ( position == FrontViewPositionRightMost ) str = @"FrontViewPositionRightMost";
  if ( position == FrontViewPositionRightMostRemoved ) str = @"FrontViewPositionRightMostRemoved";
  return str;
}


- (void)revealController:(SWRevealViewController *)revealController willMoveToPosition:(FrontViewPosition)position
{
  NSLog( @"%@: %@", NSStringFromSelector(_cmd), [self stringFromFrontViewPosition:position]);
}

- (void)revealController:(SWRevealViewController *)revealController didMoveToPosition:(FrontViewPosition)position
{
  NSLog( @"%@: %@", NSStringFromSelector(_cmd), [self stringFromFrontViewPosition:position]);
}

- (void)revealController:(SWRevealViewController *)revealController willRevealRearViewController:(UIViewController *)rearViewController
{
  NSLog( @"%@", NSStringFromSelector(_cmd));
}

- (void)revealController:(SWRevealViewController *)revealController didRevealRearViewController:(UIViewController *)rearViewController
{
  NSLog( @"%@", NSStringFromSelector(_cmd));
}

- (void)revealController:(SWRevealViewController *)revealController willHideRearViewController:(UIViewController *)rearViewController
{
  NSLog( @"%@", NSStringFromSelector(_cmd));
}

- (void)revealController:(SWRevealViewController *)revealController didHideRearViewController:(UIViewController *)rearViewController
{
  NSLog( @"%@", NSStringFromSelector(_cmd));
}

- (void)revealController:(SWRevealViewController *)revealController willShowFrontViewController:(UIViewController *)rearViewController
{
  NSLog( @"%@", NSStringFromSelector(_cmd));
}

- (void)revealController:(SWRevealViewController *)revealController didShowFrontViewController:(UIViewController *)rearViewController
{
  NSLog( @"%@", NSStringFromSelector(_cmd));
}

- (void)revealController:(SWRevealViewController *)revealController willHideFrontViewController:(UIViewController *)rearViewController
{
  NSLog( @"%@", NSStringFromSelector(_cmd));
}

- (void)revealController:(SWRevealViewController *)revealController didHideFrontViewController:(UIViewController *)rearViewController

{
  NSLog( @"%@", NSStringFromSelector(_cmd));
}


@end
