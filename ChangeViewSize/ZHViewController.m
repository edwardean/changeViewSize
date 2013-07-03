//
//  ZHViewController.m
//  ChangeViewSize
//
//  Created by Edward on 13-7-2.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHViewController.h"
#import "ZHViewA.h"

@interface ZHViewController ()

@end

@implementation ZHViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		self.title = NSStringFromClass([self class]);
	}
	return self;
}

- (void)loadView
{
  NSLog(@"view controller loadview ");
  
	ZHViewA *view = [[ZHViewA alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.view = view;
}

- (void)viewDidLoad
{
  NSLog(@"view controller did loadview");
	[super viewDidLoad];
  
	[self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews
{
  NSLog(@"View Controller Will layout subviews");
  
}

- (void)viewDidLayoutSubviews
{
  NSLog(@"View Controller Did layout subviews");
  // layout custom subviews
}

@end
