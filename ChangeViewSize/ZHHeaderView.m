//
//  ZHHeaderView.m
//  ChangeViewSize
//
//  Created by Edward on 13-7-2.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHHeaderView.h"

#define HeaderViewHeigh 					33
#define FirstTagToLeftSideMargin	10
#define ListArrowButtonRightMargin 10
#define MarginBetweenTags					5
#define TagFont										11.0

@interface ZHHeaderView ()
{
	UILabel *tagLabel_;
	CGSize tagSize;
}

@property (nonatomic, retain) NSArray *tagArray;
@property (nonatomic, retain) UIButton *moreButton;
@property (nonatomic, retain) UIFont *font;

@end

@implementation ZHHeaderView

@synthesize tagArray = tagArray_;
@synthesize moreButton = moreButton_;
@synthesize font = font_;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
			tagLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
			tagLabel_.numberOfLines = 1;
			tagSize = CGSizeMake(320, 20);
			self.font = [UIFont systemFontOfSize:TagFont];
			[self setUp];
    }
    return self;
}

- (void)addTagArray:(NSArray *)tags
{
	self.tagArray = tags;
	[self setNeedsLayout];
}

- (void)setUp
{
	self.moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[moreButton_ setFrame:CGRectMake(0, 0, 10, 14)];
	[moreButton_ setImage:[UIImage imageNamed:@"ZHListViewArrowRight@2x.png"]
							 forState:UIControlStateNormal];
	CGSize size = moreButton_.bounds.size;
	CGPoint listArrowButtonCenter;
	listArrowButtonCenter.x = 320 - ListArrowButtonRightMargin - size.width/2;
	listArrowButtonCenter.y = self.frame.size.height/2;
	[moreButton_ setCenter:listArrowButtonCenter];
	[self addSubview:moreButton_];
	
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	if ([tagArray_ count] > 0) {
		for (int i=0; i<[tagArray_ count]; i++) {
			NSString *tagString = [tagArray_ objectAtIndex:i];
			tagLabel_.text = tagString;
			CGSize expectedTagLabelSize = [tagString sizeWithFont:font_ constrainedToSize:tagSize];
			CGRect newFrame = tagLabel_.frame;
			newFrame.size.width = expectedTagLabelSize.width;
			tagLabel_.frame = newFrame;
			if (i = 0) {
				//设置第一个标签与左边缘的距离
			}
			
		}
	}
}

@end
