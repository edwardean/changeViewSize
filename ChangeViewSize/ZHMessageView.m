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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
			self.titleFont = [UIFont systemFontOfSize:TitleFontSize];
			self.messageFont = [UIFont systemFontOfSize:MessageFontSize];
			
			self.maxSize = CGSizeMake(self.frame.size.width, 1100);
			self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
			self.messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
			[_titleLabel setNumberOfLines:0];
			[_messageLabel setNumberOfLines:0];
			[_titleLabel setBackgroundColor:[UIColor clearColor]];
			[_messageLabel setBackgroundColor:[UIColor clearColor]];
			[_titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
			[_messageLabel setLineBreakMode:NSLineBreakByWordWrapping];
			[self addSubview:_titleLabel];
			[self addSubview:_messageLabel];
			
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
	
	if (_titleString) {
		CGSize lineSize = [_titleString sizeWithFont:_titleFont
															 constrainedToSize:_maxSize
																	 lineBreakMode:NSLineBreakByWordWrapping];
		[_titleLabel setFrame:CGRectMake(0, 0, lineSize.width, lineSize.height)];
		[_titleLabel setText:_titleString];
		messageOrigin.y = _titleLabel.frame.origin.y + lineSize.height;
		
	}
	
	if (_messageString) {
		CGSize messageSize = [_messageString sizeWithFont:_messageFont
																		constrainedToSize:_maxSize
																				lineBreakMode:NSLineBreakByWordWrapping];
		
		[_messageLabel setFrame:CGRectMake(0,
																			 messageOrigin.y,
																			 messageSize.width,
																			 messageSize.height)];
		[_messageLabel setText:_messageString];
	}
	
	CGRect frame = self.frame;
	frame.size.height =  _messageLabel.bounds.size.height +
	_titleLabel.bounds.size.height;
	self.frame = frame;
}

@end
