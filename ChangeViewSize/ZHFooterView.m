//
//  ZHFooterView.m
//  ChangeViewSize
//
//  Created by Edward on 13-7-2.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHFooterView.h"

#define FootherViewHeigh	44
#define MarginToLeftSide	10
#define MarginToRightSide	10
#define FansButtonToFansLabelMargin	5
#define FansLabelToCommentsButtonMargin	10
#define CommentsButtonToCommentsLabelMargin	5

#define imageSizeWidth	17
#define imageSizeHeigh	15

@interface ZHFooterView ()
{
	NSInteger fans;
	NSInteger comments;
}

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
	
	self.commentsButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[commentsButton_ setImage:[UIImage imageNamed:@"ZHQuestionViewCommentIcon@2x.png"]
									 forState:UIControlStateNormal];
	[commentsButton_ setFrame:CGRectMake(0,
																			 self.frame.size.height/2,
																			 imageSizeWidth, imageSizeHeigh)];
	CGPoint commentsButtonCenter = commentsButton_.center;
	commentsButtonCenter.y = self.center.y;
	[commentsButton_ setCenter:commentsButtonCenter];
	[self addSubview:commentsButton_];
	
	self.fansLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	[fansLabel_ setBackgroundColor:[UIColor clearColor]];
	[self addSubview:fansLabel_];
	
	self.commentsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	[commentsLabel_ setBackgroundColor:[UIColor clearColor]];
	[self addSubview:commentsLabel_];
	
	
	self.favButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[favButton_ setFrame:CGRectMake(0, 0, 55, 30)];
	[favButton_ setTitle:@"关注" forState:UIControlStateNormal];
	[favButton_ setCenter:CGPointMake(320 - MarginToRightSide - favButton_.bounds.size.width/2,
																		self.frame.size.height/2)];
	[self addSubview:favButton_];
	
}

- (void)addFans:(NSInteger)f comments:(NSInteger)c
{
	fans = f;
	comments = c;
	[self setNeedsLayout];
}

- (void)layoutSubviews
{
	NSLog(@"%s",__func__);
	[super layoutSubviews];
	CGFloat fansLabelOriginX = fansButton_.frame.origin.x
	+fansButton_.frame.size.width + FansButtonToFansLabelMargin;
	[fansLabel_ setFrame:CGRectMake(fansLabelOriginX,
																	self.frame.size.height/2,
																	0,0)];
	[fansLabel_ setText:[NSString stringWithFormat:@"%i",fans]];
	[fansLabel_ sizeToFit];
	CGPoint fansLabelCenter = self.fansLabel.center;
	fansLabelCenter.y = self.frame.size.height/2;
	[fansLabel_ setCenter:fansLabelCenter];
	
	
	CGFloat commentButtonOriginX = fansLabelOriginX +
	fansLabel_.bounds.size.width +
	FansLabelToCommentsButtonMargin;
	[commentsButton_ setFrame:CGRectMake(commentButtonOriginX,
																			 self.frame.size.height/2,
																			 17, 15)];
	CGPoint commentsButtonCenter = commentsButton_.center;
	commentsButtonCenter.y = self.frame.size.height/2;
	[commentsButton_ setCenter:commentsButtonCenter];
	
	
	
	CGFloat commemtsLabelOriginX = commentButtonOriginX +
	commentsButton_.bounds.size.width +
	CommentsButtonToCommentsLabelMargin;
	[commentsLabel_ setFrame:CGRectMake(commemtsLabelOriginX,
																			self.frame.size.height/2,
																			0, 0)];
	[commentsLabel_ setText:[NSString stringWithFormat:@"%i",comments]];
	[commentsLabel_ sizeToFit];
	CGPoint commentsLabelCenter = commentsLabel_.center;
	commentsLabelCenter.y = self.frame.size.height/2;
	[commentsLabel_ setCenter:commentsLabelCenter];
	
}
@end
