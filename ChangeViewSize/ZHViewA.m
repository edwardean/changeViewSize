//
//  ZHViewA.m
//  ChangeViewSize
//
//  Created by Edward on 13-7-2.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHViewA.h"
#import "ZHFooterView.h"
#import "ZHHeaderView.h"

static NSString *title1 = @"这是view的center，一个CGPoint类型的值。";
static NSString *string1 = @"The center is specified within the coordinate system of its superview and is measured in points. Setting this property changes the values of the frame properties accordingly.";

static NSString *title2 = @"这个一个view的框架，一个CGRect类型的结构体。";
static NSString *string2 = @"A structure that contains the location and dimensions of a rectangle.";

static NSString *title3 = @"UIResponder响应者。Object通过它来传递消息";
static NSString *string3 = @"The UIResponder class defines an interface for objects that respond to and handle events. It is the superclass of UIApplication, UIView and its subclasses (which include UIWindow). Instances of these classes are sometimes referred to as responder objects or, simply, responders.";

static NSString *title4 = @"For example, a UILabel object draws a text string and a UIImageView object draws an image.";
static NSString *string4 = @"The UIView class defines a rectangular area on the screen and the interfaces for managing the content in that area. At runtime, a view object handles the rendering of any content in its area and also handles any interactions with that content. The UIView class itself provides basic behavior for filling its rectangular area with a background color. More sophisticated content can be presented by subclassing UIView and implementing the necessary drawing and event-handling code yourself. The UIKit framework also includes a set of standard subclasses that range from simple buttons to complex tables and can be used as-is. For example, a UILabel object draws a text string and a UIImageView object draws an image.";

static NSString *title5 = @"这个是应用程序主函数。";
static NSString *string5 = @"This function is called in the main entry point to create the application object and the application delegate and set up the event cycle. This function instantiates the application object from the principal class and instantiates the delegate (if any) from the given class and sets the delegate for the application. It also sets up the main event loop, including the application’s run loop, and begins processing events. If the application’s Info.plist file specifies a main nib file to be loaded, by including the NSMainNibFile key and a valid nib file name for the value, this function loads that nib file.";

static NSString *title6 = @"这是UILabel，用来显示文本内容。";
static NSString *string6 = @"The UILabel class implements a read-only text view. You can use this class to draw one or multiple lines of static text, such as those you might use to identify other parts of your user interface. The base UILabel class provides support for both simple and complex styling of the label text. You can also control over aspects of appearance, such as whether the label uses a shadow or draws with a highlight. If needed, you can customize the appearance of your text further by subclassing.";

static NSString *title7 = @"It instead defines the common interface and behavioral structure for all its subclasses.";
static NSString *string7 = @"UIControl is the base class for control objects such as buttons and sliders that convey user intent to the application. You cannot use the UIControl class directly to instantiate controls. It instead defines the common interface and behavioral structure for all its subclasses.";

static NSString *title8 = @"";
static NSString *string8 = @"NSObject is the root class of most Objective-C class hierarchies. Through NSObject, objects inherit a basic interface to the runtime system and the ability to behave as Objective-C objects.";

static NSString *title9 = @"将一个view作为一个子视图添加到接受者的子视图列表的末尾。";
static NSString *string9 = @"Adds a view to the end of the receiver’s list of subviews. This method retains view and sets its next responder to the receiver, which is its new superview. Views can have only one superview. If view already has a superview and that view is not the receiver, this method removes the previous superview before making the receiver its new superview.";

static NSString *title10 = @"通知视图控制器app收到了低内存警告，要求viewController进行内存释放的操作。";
static NSString *string10 = @"Sent to the view controller when the app receives a memory warning. Your app never calls this method directly. Instead, this method is called when the system determines that the amount of available memory is low. You can override this method to release any additional memory used by your view controller. If you do, your implementation of this method must call the super implementation at some point.";

@interface ZHViewA ()

@property (nonatomic, retain) NSArray *stringArray;
@property (nonatomic, retain) NSArray *titleArray;

- (NSUInteger)stringRandomIndex;
- (NSUInteger)titleRandomIndex;

@end

@implementation ZHViewA

@synthesize stringArray = stringArray_;
@synthesize titleArray = titleArray_;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
			self.stringArray = @[string1,string2,string3,string4,string5,string6,string7,string8,string9,string10];
			self.titleArray = @[title1,title2,title3,title4,title5,title6,title7,title8,title9,title10];
    }
    return self;
}

- (NSUInteger)stringRandomIndex
{
	return arc4random() % [stringArray_ count];
}

- (NSUInteger)titleRandomIndex
{
	return arc4random() % [titleArray_ count];
}

- (NSString *)calculateString
{
	return [stringArray_ objectAtIndex:[self stringRandomIndex]];
}

- (NSString *)calculateTitle
{
	return [titleArray_ objectAtIndex:[self titleRandomIndex]];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	NSLog(@"%s",__func__);
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button setTitle:@"TapMe" forState:UIControlStateNormal];
	[button setFrame:CGRectMake(0, 0, 60, 35)];
	[button setCenter:self.center];
	[button addTarget:self action:@selector(buttonCallback) forControlEvents:UIControlEventTouchUpInside];
	[self addSubview:button];
	

	
	ZHHeaderView *headerView = [[ZHHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
	[headerView setBackgroundColor:[UIColor lightGrayColor]];
	[self addSubview:headerView];
	
	
	ZHFooterView *footerView = [[ZHFooterView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
	[footerView setBackgroundColor:[UIColor whiteColor]];
	CGRect headerViewFrame = headerView.frame;
	CGRect footerViewFrame = footerView.frame;
	footerViewFrame.origin.y = headerViewFrame.origin.y + headerViewFrame.size.height;
	[footerView setFrame:footerViewFrame];
	[self addSubview:footerView];
	
	[footerView addFans:90 comments:6];
	
	
}


//- (CGSize)sizeThatFits:(CGSize)size
//{
//	return CGSizeZero;
//}

- (void)buttonCallback
{
	//NSLog(@"%@",[self calculateString]);
	NSLog(@"%@",[self calculateTitle]);
}

@end
