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

@end

@implementation ZHMessageView

@synthesize titleLabel = titleLabel_;
@synthesize titleString = titleString_;
@synthesize messageString = messageString_;
@synthesize messageLabel = messageLabel_;

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.titleFont = [UIFont systemFontOfSize:TitleFontSize];
		self.messageFont = [UIFont systemFontOfSize:MessageFontSize];
		
		self.maxSize = CGSizeMake(self.frame.size.width, 200);
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
  [messageLabel_ setText:messageString_];
  [titleLabel_ setText:titleString_];
  
	[self setNeedsLayout];
}

- (void)layoutSubviews
{
	NSLog(@"%s",__func__);
  
	[super layoutSubviews];
  
	CGPoint messageOrigin = CGPointZero;
	
  if (self.titleLabel.text.length > 0) {
    CGSize lineSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font
                                       constrainedToSize:_maxSize
                                           lineBreakMode:self.titleLabel.lineBreakMode];
		[titleLabel_ setFrame:CGRectMake(0, 0, lineSize.width, lineSize.height)];
		messageOrigin.y = titleLabel_.frame.origin.y + lineSize.height;
	} else {
    [titleLabel_ setFrame:CGRectZero];
	}
  
  CGSize messageSize = CGSizeZero;
  if (self.messageLabel.text.length > 0) {
    messageSize = [self.messageLabel.text sizeWithFont:self.messageLabel.font
                                     constrainedToSize:_maxSize
                                         lineBreakMode:self.messageLabel.lineBreakMode];
		
		[messageLabel_ setFrame:CGRectMake(0,
																			 messageOrigin.y,
																			 messageSize.width,
																			 messageSize.height)];
	} else {
    [messageLabel_ setFrame:CGRectZero];
	}
}

- (CGSize)sizeThatFits:(CGSize)size
{
  NSLog(@"%s",__func__);
  
  CGSize lineSize = CGSizeZero;
  if (self.titleLabel.text.length > 0) {
    lineSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font
                                constrainedToSize:_maxSize
                                    lineBreakMode:self.titleLabel.lineBreakMode];
  }
  
  CGSize messageSize = CGSizeZero;
  if (self.messageLabel.text.length > 0) {
    messageSize = [self.messageLabel.text sizeWithFont:self.messageLabel.font
                                     constrainedToSize:_maxSize
                                         lineBreakMode:self.messageLabel.lineBreakMode];
  }
  
  CGRect frame = self.frame;
  frame.size.height = messageSize.height + lineSize.height;
  
  return frame.size;
}

@end
