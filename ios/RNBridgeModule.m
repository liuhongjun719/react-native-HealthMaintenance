//
//  RNBridgeModule.m
//  HealthMaintenance
//
//  Created by 123456 on 16/8/1.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RNBridgeModule.h"
#import "RNInvokeOCDetailViewController.h"
#import "SWRevealViewController.h"

#import "RCTBridge.h"
#import "RCTEventDispatcher.h"

@interface RNBridgeModule ()
@property (nonatomic, strong) RCTBridge *bridge;
@end

@implementation RNBridgeModule
RCT_EXPORT_MODULE();

#pragma mark- RN传参数调用原生OC
//RN传参数调用原生OC,并且返回数据给RN  通过CallBack
RCT_EXPORT_METHOD(RNInvokeOCCallBack:(NSDictionary *)dictionary callback:(RCTResponseSenderBlock)callback){
  NSLog(@"接收到RN传过来的数据为:%@",dictionary);
  NSArray *events = [[NSArray alloc] initWithObjects:@"aa",@"bb", nil];
  callback(@[[NSNull null], events]);
  
  SWRevealViewController *con = (SWRevealViewController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
  callback(@[[NSNull null]]);
  RNInvokeOCDetailViewController *detailViewController = [[RNInvokeOCDetailViewController alloc] init];
  detailViewController.contentDictionary = dictionary;
  UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
  [con presentViewController:navigationController animated:YES completion:nil];
}



RCT_EXPORT_METHOD(gotoSelectPage:(RCTResponseSenderBlock)callback)

{
  NSLog(@"%@", [[[[UIApplication sharedApplication] keyWindow] rootViewController] class]);//SWRevealViewController
  SWRevealViewController *con = (SWRevealViewController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
  callback(@[[NSNull null]]);
//  NSLog(@"parentViewController------:%@", [con parentViewController]);
  RNInvokeOCDetailViewController *detailViewController = [[RNInvokeOCDetailViewController alloc] init];
  UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
  [con presentViewController:navigationController animated:YES completion:nil];
}

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}


#pragma mark- 原生OC调用RN
RCT_EXPORT_METHOD(OCInvokeRN:(NSDictionary *)dictionary){
  NSString *value=[dictionary objectForKey:@"name"];
//  if([value isEqualToString:@"jiangqq"]){
    [self.bridge.eventDispatcher sendAppEventWithName:@"EventReminder" body:@{@"name":[NSString stringWithFormat:@"%@",value],@"errorCode":@"0",@"msg":@"成功"}];
//  }else{
//    [self.bridge.eventDispatcher sendAppEventWithName:@"EventReminder" body:@{@"name":[NSString stringWithFormat:@"%@",value],@"errorCode":@"0",@"msg":@"输入的name不是jiangqq"}];
//  }
}


@end
