//
//  RNRequest.m
//  HealthMaintenance
//
//  Created by 123456 on 16/8/2.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RNRequest.h"
#import "RCTBundleURLProvider.h"
#import "RCTRootView.h"

@implementation RNRequest
- (UIView *)getRootView:(NSDictionary *)properties {
  NSURL *jsCodeLocation;
  
  jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios&dev=false"];
  
  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"HealthMaintenance"
                                               initialProperties:properties
                                                   launchOptions:nil];
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
  return rootView;
}

@end
