//
//  ZHHeaderView.m
//  ChangeViewSize
//
//  Created by Edward on 13-7-2.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHHeaderView.h"

#define HeaderViewHeigh 					33
#define FirstTagToLeftSideMargin	10		//第一个标签距离左边的距离
#define ListArrowButtonRightMargin 10		//右边箭头距离右边的距离
#define MarginBetweenTags					5			//每两个tag标签的间距
#define TagFont										12.0	//标签的字体大小
#define TagCapWidth								8			//标签文本离背景图片两边的距离
#define TagHeight									22		//标签高度

@interface ZHHeaderView ()
{
	UILabel *tagLabel_;
	CGSize tagSize_;
	
	CGFloat tagLabelOriginX;	//每个标签左边x坐标
	CGFloat allTagWidth;			//用来计算所有标签宽度总和，若大于屏幕宽度则最后一个标签用...表示
	CGFloat tagLabelWidth;		//每个标签的宽度
	CGFloat maxTagWidth;			//所有标签的宽度总和
	
}

@property (nonatomic, retain) NSArray *tagArray;
@property (nonatomic, retain) UIButton *moreButton;
@property (nonatomic, retain) UIFont *font;
@property (nonatomic, retain) UIImage *tagBackgroundImage;

/**
 * 添加每个标签
 * @param leftOrigin 每个标签的左边坐标
 * @param tagWidth	每个标签的宽度
 * @param tagTitle 每个标签的标题文字
 **/
- (void)addTagBackgroundByX:(CGFloat)leftOrigin
											Width:(CGFloat)tagWidth
									 TagTitle:(NSString *)tagTitle;

@end

@implementation ZHHeaderView

@synthesize tagArray = tagArray_;
@synthesize moreButton = moreButton_;
@synthesize font = font_;
@synthesize tagBackgroundImage = tagBackgroundImage_;

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		tagLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, TagHeight)];
		tagLabel_.numberOfLines = 1;
		tagLabel_.textAlignment = NSTextAlignmentCenter;
		[tagLabel_ setContentMode:UIViewContentModeCenter];
		tagSize_ = CGSizeMake(320, TagHeight);
		self.font = [UIFont systemFontOfSize:TagFont];
		[tagLabel_ setFont:self.font];
		[tagLabel_ setTextColor:[UIColor colorWithRed:0.437
																						green:0.708
																						 blue:0.943
																						alpha:1.000]];
		self.tagBackgroundImage = [[UIImage imageNamed:@"ZHQuestionViewTopicBase.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
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
	maxTagWidth = moreButton_.frame.origin.x;
}

- (void)layoutSubviews
{
	//NSLog(@"%s",__func__);
	[super layoutSubviews];
	
	for (id subView in self.subviews) {
    if ([subView isKindOfClass:[UIImageView class]]) {
			[subView removeFromSuperview];
		}
	}
	
	allTagWidth = 0.0;
	[tagArray_ enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		NSString *tagString = (NSString *)obj;
		CGSize expectedTagLabelSize = [tagString sizeWithFont:font_
																				constrainedToSize:tagSize_];
		
		CGRect newFrame = tagLabel_.frame;
		newFrame.size.width = expectedTagLabelSize.width;
		tagLabel_.frame = newFrame;
		
		tagLabelWidth = newFrame.size.width;
		if (idx == 0) {
			//设置第一个标签与左边缘的距离
			tagLabelOriginX = FirstTagToLeftSideMargin;
			
		} else tagLabelOriginX += (tagLabelWidth + MarginBetweenTags);
		allTagWidth += (tagLabelOriginX + tagLabelWidth);
		if (allTagWidth >= maxTagWidth) {
			tagString = @"...";
			[self addTagBackgroundByX:tagLabelOriginX Width:tagLabelWidth TagTitle:tagString];
			*stop = YES;
		} else {
			[self addTagBackgroundByX:tagLabelOriginX Width:tagLabelWidth TagTitle:tagString];
		}
		NSLog(@"%@  Size:%@",tagString,NSStringFromCGSize(tagLabel_.frame.size));
	}];
	
}

- (void)addTagBackgroundByX:(CGFloat)leftOrigin
											Width:(CGFloat)tagWidth
									 TagTitle:(NSString *)tagTitle
{
	
	CGRect tagFrame = tagLabel_.frame;
	tagFrame.origin.x = leftOrigin;
	tagFrame.origin.y = self.frame.size.height/2 - TagHeight/2;
	
	UIImageView *labelBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(leftOrigin, tagFrame.origin.y, tagWidth, TagHeight)];
	
	UILabel *label = [[UILabel alloc] initWithFrame:tagFrame];
	[label setText:tagTitle];
	[label setTextAlignment:NSTextAlignmentCenter];
	[label setBackgroundColor:[UIColor colorWithPatternImage:tagBackgroundImage_]];
	[label setTextColor:[UIColor colorWithRed:0.437
																			green:0.708
																			 blue:0.943
																			alpha:1.000]];
	[label setFont:self.font];
	[labelBackgroundImageView addSubview:label];
	[self addSubview:labelBackgroundImageView];	
}

@end
