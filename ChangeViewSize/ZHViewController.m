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
  NSLog(@"%s",__func__);
	ZHViewA *view = [[ZHViewA alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.view = view;
}

- (void)viewDidLoad
{
  NSLog(@"%s",__func__);
	[super viewDidLoad];
	[self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}


- (void)viewWillLayoutSubviews
{
	NSLog(@"%s",__func__);
}

- (void)viewDidLayoutSubviews
{
	NSLog(@"%s",__func__);
}


@end
