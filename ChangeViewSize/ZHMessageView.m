//
//  ZHMessageView.m
//  ChangeViewSize
//
//  Created by Edward on 13-7-3.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHMessageView.h"
#import "UIView+Frame.h"

#define TitleFontSize			17
#define MessageFontSize		13

@interface ZHMessageView ()

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *messageLabel;
@property (nonatomic, assign) CGSize maxSize;
@property (nonatomic, retain) UIFont *titleFont;
@property (nonatomic, retain) UIFont *messageFont;

- (CGSize)titleLabelSize;
- (CGSize)messageLabelSize;

@end

@implementation ZHMessageView

@synthesize titleLabel = titleLabel_;
@synthesize messageLabel = messageLabel_;
@synthesize maxSize = maxSize_;
@synthesize titleFont = titleFont_;
@synthesize messageFont = messageFont_;

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
    NSLog(@"%s",__func__);
    self.titleFont = [UIFont systemFontOfSize:TitleFontSize];
    self.messageFont = [UIFont systemFontOfSize:MessageFontSize];
		
    self.maxSize = CGSizeMake(self.frame.size.width, 200);
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [titleLabel_ setNumberOfLines:0];
    [messageLabel_ setNumberOfLines:0];
    [titleLabel_ setFont:self.titleFont];
    [messageLabel_ setFont:self.messageFont];
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
  
  [self.titleLabel setText:title];
  [self.messageLabel setText:message];
  
	[self setNeedsLayout];
}

- (void)layoutSubviews
{
	NSLog(@"%s",__func__);
	[super layoutSubviews];
  
	CGPoint messageOrigin = CGPointZero;
	
	if (self.titleLabel.text.length > 0) {
    CGSize lineSize = [self titleLabelSize];
    
    [titleLabel_ setWidth:lineSize.width];
    [titleLabel_ setHeight:lineSize.height];
    
    messageOrigin.y = [titleLabel_ bottom];
		
	} else {
  	[titleLabel_ setFrame:CGRectZero];
  }
	
	if (self.messageLabel.text.length > 0) {
    CGSize messageSize = [self messageLabelSize];
		
    [messageLabel_ setY:messageOrigin.y];
    [messageLabel_ setWidth:messageSize.width];
    [messageLabel_ setHeight:messageSize.height];
  } else {
  	[messageLabel_ setFrame:CGRectZero];
  }
  
}


- (CGSize)sizeThatFits:(CGSize)size
{
  NSLog(@"%s",__func__);
  CGRect frame = self.frame;
  CGSize titleLabelSize = [self titleLabelSize];
  CGSize messageLabelSize  =[self messageLabelSize];
	frame.size.height =  titleLabelSize.height + messageLabelSize.height;
  return frame.size;
}


#pragma mark - return Two Label Size

- (CGSize)titleLabelSize
{
	return [self.titleLabel.text sizeWithFont:self.titleLabel.font
                          constrainedToSize:maxSize_
                              lineBreakMode:self.titleLabel.lineBreakMode];
}

- (CGSize)messageLabelSize
{
	return [self.messageLabel.text sizeWithFont:self.messageLabel.font
                            constrainedToSize:maxSize_
                                lineBreakMode:self.messageLabel.lineBreakMode];
}

@end
