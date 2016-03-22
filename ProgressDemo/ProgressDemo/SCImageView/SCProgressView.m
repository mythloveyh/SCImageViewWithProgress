//
//  SCProgressView.m
//  ProgressDemo
//
//  Created by Digger on 16/3/12.
//  Copyright © 2016年 ppl. All rights reserved.
//

#import "SCProgressView.h"

@implementation SCProgressView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.layer.opacity = 0.6;
        self.layer.backgroundColor = [UIColor grayColor].CGColor;
    }
    return self;
}

-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGFloat radius = self.frame.size.height >= self.frame.size.width ? self.frame.size.width : self.frame.size.height;
    CGFloat startAngle = - ((float)M_PI / 2); // 90 degrees
    CGFloat endAngle = (2 * (float)M_PI) + startAngle;
    UIBezierPath *processPath = [UIBezierPath bezierPath];
    processPath.lineWidth = 3.f;
    [[UIColor whiteColor] setStroke];
    endAngle = (self.progress * 2 * (float)M_PI) + startAngle;
    [processPath addArcWithCenter:self.center radius:radius * 0.2 startAngle:startAngle endAngle:endAngle clockwise:YES];
    [processPath stroke];
}

@end
