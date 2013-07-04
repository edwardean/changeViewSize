//
//  ZHFooterView.m
//  ChangeViewSize
//
//  Created by Edward on 13-7-2.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHFooterView.h"
#import "UIView+Frame.h"

#define FootherViewHeigh	44
#define MarginToLeftSide	10
#define MarginToRightSide	10
#define FansButtonToFansLabelMargin	5
#define FansLabelToCommentsButtonMargin	10
#define CommentsButtonToCommentsLabelMargin	5

#define imageSizeWidth	17
#define imageSizeHeigh	15

@interface ZHFooterView ()

@property (nonatomic, retain) UIView *footherView;
@property (nonatomic, retain) UIButton *favButton;
@property (nonatomic, retain) UIButton *fansButton;
@property (nonatomic, retain) UIButton *commentsButton;
@property (nonatomic, retain) UILabel *fansLabel;
@property (nonatomic, retain) UILabel *commentsLabel;

@end

@implementation ZHFooterView

@synthesize footherView = footherView_;
@synthesize favButton = favButton_;
@synthesize fansButton = fansButton_;
@synthesize commentsButton = commentsButton_;
@synthesize fansLabel = fansLabel_;
@synthesize commentsLabel = commentsLabel_;

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
    NSLog(@"%s",__func__);
		[self setUp];
	}
	return self;
}

- (void)setUp
{
  // 设置关注按钮
	self.fansButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[fansButton_ setImage:[UIImage imageNamed:@"ZHQuestionViewFollowingIcon@2x.png"]
							 forState:UIControlStateNormal];
	[fansButton_ setFrame:CGRectMake(MarginToLeftSide,
																	 self.frame.size.height/2,
																	 imageSizeWidth, imageSizeHeigh)];
	CGPoint fansButtonCenter = fansButton_.center;
	fansButtonCenter.y = self.center.y;
	[fansButton_ setCenter:fansButtonCenter];
	[self addSubview:fansButton_];
	
  // 设置评论按钮
	self.commentsButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[commentsButton_ setImage:[UIImage imageNamed:@"ZHQuestionViewCommentIcon@2x.png"]
									 forState:UIControlStateNormal];
	[self addSubview:commentsButton_];
	
  
  UIColor *fontColor = [UIColor colorWithWhite:0.510 alpha:1.000];
  UIFont *textFont = [UIFont systemFontOfSize:14];
  
  // 设置关注标签
	self.fansLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	[fansLabel_ setBackgroundColor:[UIColor clearColor]];
  [fansLabel_ setTextColor:fontColor];
  [fansLabel_ setFont:textFont];
	[self addSubview:fansLabel_];
	
  
  // 设置评论标签
	self.commentsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	[commentsLabel_ setBackgroundColor:[UIColor clearColor]];
  [commentsLabel_ setTextColor:fontColor];
  [commentsLabel_ setFont:textFont];
	[self addSubview:commentsLabel_];
	
	
  // 设置关注按钮
	self.favButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[favButton_ setFrame:CGRectMake(0, 0, 55, 30)];
	[favButton_ setTitle:@"关注" forState:UIControlStateNormal];
	[favButton_ setCenter:CGPointMake(320 - MarginToRightSide - favButton_.bounds.size.width/2,
																		self.frame.size.height / 2)];
	[self addSubview:favButton_];
	
}

- (void)addFans:(NSInteger)f comments:(NSInteger)c
{
  [fansLabel_ setText:[NSString stringWithFormat:@"%i",f]];
  
  [commentsLabel_ setText:[NSString stringWithFormat:@"%i",c]];
  
	[self setNeedsLayout];
}

- (void)layoutSubviews
{
	NSLog(@"%s",__func__);
	[super layoutSubviews];
  
  [fansLabel_ sizeToFit];
	//CGFloat fansLabelOriginX = fansButton_.frame.origin.x + fansButton_.frame.size.width + FansButtonToFansLabelMargin;
  CGFloat fansLabelOriginX = [fansButton_ right] + FansButtonToFansLabelMargin;
  //[fansLabel_ setFrame:CGRectMake(fansLabelOriginX, 0, self.fansLabel.frame.size.width, self.fansLabel.frame.size.height)];
  [fansLabel_ setX:fansLabelOriginX];
  
//	CGPoint fansLabelCenter = self.fansLabel.center;
//	fansLabelCenter.y = self.frame.size.height / 2;
//	[fansLabel_ setCenter:fansLabelCenter];
  [fansLabel_ setCenterY:[self height]/2];
  
  
	CGFloat commentButtonOriginX = fansLabelOriginX + fansLabel_.frame.size.width +
	FansLabelToCommentsButtonMargin;
  [commentsButton_ setFrame:CGRectMake(commentButtonOriginX,
																			 0,
																			 imageSizeWidth,
                                       imageSizeHeigh)];
	CGPoint commentsButtonCenter = commentsButton_.center;
	commentsButtonCenter.y = self.frame.size.height / 2;
	[commentsButton_ setCenter:commentsButtonCenter];
	
	
	CGFloat commemtsLabelOriginX = commentButtonOriginX + commentsButton_.bounds.size.width +
	CommentsButtonToCommentsLabelMargin;
  [commentsLabel_ sizeToFit];
	[commentsLabel_ setFrame:CGRectMake(commemtsLabelOriginX,
																			self.frame.size.height / 2,
																			self.commentsLabel.frame.size.width,
                                      self.commentsLabel.frame.size.height)];
	CGPoint commentsLabelCenter = commentsLabel_.center;
	commentsLabelCenter.y = self.frame.size.height / 2;
	[commentsLabel_ setCenter:commentsLabelCenter];
}
@end
