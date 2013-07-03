//
//  ZHMessageView.m
//  ChangeViewSize
//
//  Created by Edward on 13-7-3.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHMessageView.h"

#define TitleFontSize			17
#define MessageFontSize		13

@interface ZHMessageView ()

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *messageLabel;
@property (nonatomic, assign) CGSize maxSize;
@property (nonatomic, retain) UIFont *titleFont;
@property (nonatomic, retain) UIFont *messageFont;

@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, copy) NSString *messageString;

- (CGSize)titleLabelSize;
- (CGSize)messageLabelSize;

@end

@implementation ZHMessageView

@synthesize titleLabel = titleLabel_;
@synthesize messageLabel = messageLabel_;
@synthesize maxSize = maxSize_;
@synthesize titleFont = titleFont_;
@synthesize messageFont = messageFont_;
@synthesize titleString = titleString_;
@synthesize messageString = messageString_;

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
  NSLog(@"%s",__func__);
	self.titleFont = [UIFont systemFontOfSize:TitleFontSize];
	self.messageFont = [UIFont systemFontOfSize:MessageFontSize];
		
	self.maxSize = CGSizeMake(self.frame.size.width, 1100);
	self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	self.messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	[titleLabel_ setNumberOfLines:0];
	[messageLabel_ setNumberOfLines:0];
	[titleLabel_ setBackgroundColor:[UIColor clearColor]];
	[messageLabel_ setBackgroundColor:[UIColor clearColor]];
	[titleLabel_ setLineBreakMode:NSLineBreakByWordWrapping];
	[messageLabel_ setLineBreakMode:NSLineBreakByWordWrapping];
	[self addSubview:titleLabel_];
	[self addSubview:messageLabel_];
		
	}
	return self;
}

- (void)addTitle:(NSString *)title andMessage:(NSString *)message
{
	self.titleString = title;
	self.messageString = message;
	[self setNeedsLayout];
}

- (void)layoutSubviews
{
	NSLog(@"%s",__func__);
	[super layoutSubviews];
	CGPoint messageOrigin = CGPointZero;
	
	if (titleString_) {
	CGSize lineSize = [titleString_ sizeWithFont:titleFont_
															 constrainedToSize:maxSize_
																	 lineBreakMode:NSLineBreakByWordWrapping];
	[titleLabel_ setFrame:CGRectMake(0, 0, lineSize.width, lineSize.height)];
	[titleLabel_ setText:titleString_];
	messageOrigin.y = titleLabel_.frame.origin.y + lineSize.height;
		
	}
	
	if (messageString_) {
	CGSize messageSize = [messageString_ sizeWithFont:messageFont_
																		constrainedToSize:maxSize_
																				lineBreakMode:NSLineBreakByWordWrapping];
		
	[messageLabel_ setFrame:CGRectMake(0,
																			 messageOrigin.y,
																			 messageSize.width,
																			 messageSize.height)];
	[messageLabel_ setText:messageString_];
 }
  
}


- (CGSize)sizeThatFits:(CGSize)size
{
  NSLog(@"%s",__func__);
  CGRect frame = self.frame;
	frame.size.height =  messageLabel_.bounds.size.height +
	titleLabel_.bounds.size.height;
  return frame.size;
}



#pragma mark - return Label Size

@end
