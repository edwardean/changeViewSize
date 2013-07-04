//
//  ZHCustomFrame.m
//  28CustomFrame
//
//  Created by Edward on 13-6-28.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHCustomFrame.h"

@implementation ZHCustomFrame

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


#pragma Override Set Methods
- (void)setOriginx:(CGFloat)originx
{
	CGRect frame = self.frame;
  frame.origin.x = originx;
  self.frame = frame;
}

- (void)setOriginy:(CGFloat)originy
{
	CGRect frame = self.frame;
  frame.origin.y = originy;
  self.frame = frame;
}

- (void)setCenterx:(CGFloat)centerx
{
	CGPoint center = self.center;
  center.x = centerx;
  self.center = center;
}

- (void)setCentery:(CGFloat)centery
{
	CGPoint center = self.center;
  center.y = centery;
  self.center = center;
}

- (void)setWidth:(CGFloat)width
{
  if (width != self.frame.size.width) {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
  }
}
- (void)setHeight:(CGFloat)height
{
  if (height != self.frame.size.height) {
  CGRect frame = self.frame;
  frame.size.height = height;
  self.frame = frame;
  }
}

#pragma mark - get method
- (CGFloat)originx
{
	return self.frame.origin.x;
}

- (CGFloat)originy
{
	return self.frame.origin.y;
}

- (CGFloat)centerx
{
	return self.center.x;
}

- (CGFloat)centery
{
	return self.center.y;
}

- (CGFloat)width
{
	return self.frame.size.width;
}

- (CGFloat)height
{
  return self.frame.size.height;
}

@end
