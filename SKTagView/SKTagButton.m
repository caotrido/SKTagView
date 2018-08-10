//
// Created by Shaokang Zhao on 15/1/12.
// Copyright (c) 2015 Shaokang Zhao. All rights reserved.
//

#import "SKTagButton.h"
#import "SKTag.h"

@implementation SKTagButton

+ (instancetype)buttonWithTag:(SKTag *)tag
{
    SKTagButton *btn = [super buttonWithType:UIButtonTypeCustom];

    if (tag.attributedText) {
        [btn setAttributedTitle:tag.attributedText forState:UIControlStateNormal];
    } else {
        [btn setTitle:tag.text forState:UIControlStateNormal];
        [btn setTitleColor:tag.textColor forState:UIControlStateNormal];
        btn.titleLabel.font = tag.font ?: [UIFont systemFontOfSize:tag.fontSize];
    }

    btn.backgroundColor = tag.bgColor;
    btn.contentEdgeInsets = tag.padding;
    btn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;

    if (tag.bgImg)
    {
        [btn setBackgroundImage:tag.bgImg forState:UIControlStateNormal];
    }

    if (tag.borderColor)
    {
        btn.layer.borderColor = tag.borderColor.CGColor;
    }

    if (tag.borderWidth)
    {
        btn.layer.borderWidth = tag.borderWidth;
    }

    if (tag.gradientsColors)
    {
        [btn setupGradient:tag.gradientsColors];
    }

    btn.userInteractionEnabled = tag.enable;

    btn.layer.cornerRadius = tag.cornerRadius;
    btn.layer.masksToBounds = YES;

    return btn;
}

- (void)setupGradient:(NSArray *)colors
{
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.colors = colors;
    self.gradientLayer.startPoint = CGPointMake(0, 1);
    self.gradientLayer.endPoint = CGPointMake(1, 1);
    [self.layer insertSublayer:self.gradientLayer atIndex:0];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.gradientLayer)
    {
        self.gradientLayer.frame = self.bounds;
    }
}

@end
