/*

 Copyright (c) 2013 Joan Lluch <joan.lluch@sweetwilliamsl.com>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished
 to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.

*/

#import "RearViewController.h"

#import "SWRevealViewController.h"
#import "FrontViewController.h"

#import "MoxibustionViewController.h"
#import "MeridianViewController.h"
#import "AcupunctureViewController.h"
#import "AcupointViewController.h"
#import "MedicatedViewController.h"


#import "RCTBundleURLProvider.h"
#import "RCTRootView.h"

#define kRGB(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface RearViewController()
{
    NSInteger _presentedRow;
  NSArray *_titleArray;
}

@end

@implementation RearViewController

@synthesize rearTableView = _rearTableView;

/*
 * The following lines are crucial to understanding how the SWRevealViewController works.
 *
 * In this example, we show how a SWRevealViewController can be contained in another instance
 * of the same class. We have three scenarios of hierarchies as follows
 *
 * In the first scenario a FrontViewController is contained inside of a UINavigationController.
 * And the UINavigationController is contained inside of a SWRevealViewController. Thus the
 * following hierarchy is created:
 *
 * - SWRevealViewController is parent of:
 * - 1 UINavigationController is parent of:
 * - - 1.1 RearViewController
 * - 2 UINavigationController is parent of:
 * - - 2.1 FrontViewController
 *
 * In the second scenario a MapViewController is contained inside of a UINavigationController.
 * And the UINavigationController is contained inside of a SWRevealViewController. Thus the
 * following hierarchy is created:
 *
 * - SWRevealViewController is parent of:
 * - 1 UINavigationController is parent of:
 * - - 1.1 RearViewController
 * - 2 UINavigationController is parent of:
 * - - 1.2 MapViewController
 *
 * In the third scenario a SWRevealViewController is contained directly inside of another.
 * SWRevealController. Thus the following hierarchy is created:
 *
 * - SWRevealViewController is parent of:
 * - 1 UINavigationController is parent of:
 * - - 1.1 RearViewController
 * - 2 SWRevealViewController
 * - - ...
 *
 * The second SWRevealViewController on the third scenario can in turn contain anything.
 * On this example it may recursively contain any of the above, including again the third one
 */

- (void)viewDidLoad
{
	[super viewDidLoad];
  _titleArray = @[@"首页", @"艾灸养生", @"经络养生", @"针灸养生", @"穴位养生", @"药膳养生"];
  _rearTableView.backgroundColor = kRGB(16, 158, 215, 1.0);

	
    // We determine whether we have a grand parent SWRevealViewController, this means we are at least one level behind the hierarchy
    SWRevealViewController *parentRevealController = self.revealViewController;
    SWRevealViewController *grandParentRevealController = parentRevealController.revealViewController;
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon.png"]
            style:UIBarButtonItemStyleBordered target:grandParentRevealController action:@selector(revealToggle:)];
    
    // if we have a reveal controller as a grand parent, this means we are are being added as a
    // child of a detail (child) reveal controller, so we add a gesture recognizer provided by our grand parent to our
    // navigation bar as well as a "reveal" button, we also set
    if ( grandParentRevealController )
    {
        // to present a title, we count the number of ancestor reveal controllers we have, this is of course
        // only a hack for demonstration purposes, on a real project you would have a model telling this.
        NSInteger level=0;
        UIViewController *controller = grandParentRevealController;
        while( nil != (controller = [controller revealViewController]) )
            level++;
        
        NSString *title = [NSString stringWithFormat:@"Detail Level %ld", (long)level];
            
        [self.navigationController.navigationBar addGestureRecognizer:grandParentRevealController.panGestureRecognizer];
        self.navigationItem.leftBarButtonItem = revealButtonItem;
        self.navigationItem.title = title;
    }
    
    // otherwise, we are in the top reveal controller, so we just add a title
    else
    {
        self.navigationItem.title = @"Master";
    }
  self.rearTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    SWRevealViewController *grandParentRevealController = self.revealViewController.revealViewController;
    grandParentRevealController.bounceBackOnOverdraw = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    SWRevealViewController *grandParentRevealController = self.revealViewController.revealViewController;
    grandParentRevealController.bounceBackOnOverdraw = YES;
}


#pragma marl - UITableView Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  if (section == 0) {
    return _titleArray.count;
  }
  return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
	if (nil == cell)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
	}
  cell.backgroundColor = kRGB(16, 158, 215, 1.0);
  cell.textLabel.textColor = [UIColor whiteColor];
  if (indexPath.section == 0) {
    cell.textLabel.text = NSLocalizedString(_titleArray[indexPath.row], nil );
  }else {
    cell.textLabel.text = @"发现APP";
  }
  UIView *backgroundView = [[UIView alloc] init];
  backgroundView.backgroundColor = kRGB(4, 146, 207, 1.0);
  cell.selectedBackgroundView = backgroundView;
	
	return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
  if (section == 0) {
    return 0;
  }
  return 40.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 40.f;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
  if (section == 1) {
    UILabel *label = [[UILabel alloc] init];
    label.text = @"关于我们";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    return label;
  }
  return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  UILabel *label = [[UILabel alloc] init];
  label.textColor = [UIColor whiteColor];
  if (section == 0) {
    label.text = @"  中医养生";
  }else {
    label.text = @"  其他";
  }
  return label;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Grab a handle to the reveal controller, as if you'd do with a navigtion controller via self.navigationController.
    SWRevealViewController *revealController = self.revealViewController;
  revealController.title = _titleArray[indexPath.row];
    
    // selecting row
    NSInteger row = indexPath.row;
    
    // if we are trying to push the same row or perform an operation that does not imply frontViewController replacement
    // we'll just set position and return
    
    if ( row == _presentedRow )
    {

        [revealController setFrontViewPosition:FrontViewPositionLeft animated:YES];
        return;
    }
  
  

    UINavigationController *newFrontController = nil;

    if (row == 0)
    {
        FrontViewController *frontViewController = [[FrontViewController alloc] init];
        frontViewController.title = _titleArray[indexPath.row];
        newFrontController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
    }
    
    else if (row == 1)
    {
        MoxibustionViewController *moxibustionViewController = [[MoxibustionViewController alloc] init];
      moxibustionViewController.title = _titleArray[indexPath.row];
        newFrontController = [[UINavigationController alloc] initWithRootViewController:moxibustionViewController];
      
    }
    
    else if ( row == 2 )
    {
      MeridianViewController *meridianViewController = [[MeridianViewController alloc] init];
      meridianViewController.title = _titleArray[indexPath.row];
      newFrontController = [[UINavigationController alloc] initWithRootViewController:meridianViewController];
    }
    else if ( row == 3 )
    {
      AcupunctureViewController *acupunctureViewController = [[AcupunctureViewController alloc] init];
      acupunctureViewController.title = _titleArray[indexPath.row];
      newFrontController = [[UINavigationController alloc] initWithRootViewController:acupunctureViewController];
    }
    else if ( row == 4 )
    {
      AcupointViewController *acupointViewController = [[AcupointViewController alloc] init];
      acupointViewController.title = _titleArray[indexPath.row];
      newFrontController = [[UINavigationController alloc] initWithRootViewController:acupointViewController];
    }
    else if ( row == 5 )
    {
      MedicatedViewController *medicatedViewController = [[MedicatedViewController alloc] init];
      medicatedViewController.title = _titleArray[indexPath.row];
      newFrontController = [[UINavigationController alloc] initWithRootViewController:medicatedViewController];
    }
  newFrontController.navigationBar.barTintColor = kRGB(18, 172, 233, 1.0);
  newFrontController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor whiteColor],
                                                                  UITextAttributeFont : [UIFont boldSystemFontOfSize:18]};
    [revealController pushFrontViewController:newFrontController animated:YES];
    
    _presentedRow = row;  // <- store the presented row
}



@end