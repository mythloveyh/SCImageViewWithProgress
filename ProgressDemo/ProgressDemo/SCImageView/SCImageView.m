//
//  SCImageView.m
//  ProgressDemo
//
//  Created by Digger on 16/3/12.
//  Copyright © 2016年 ppl. All rights reserved.
//

#import "SCImageView.h"
#import "SCProgressView.h"

@interface SCImageView()

@property (nonatomic,strong) UIImage* backgroundImage;
@property (nonatomic,weak) SCProgressView* progressView;

@end

@implementation SCImageView

- (instancetype)initWithImage:(UIImage *)image{
    self = [super init];
    if (self) {
        self.backgroundImage = image;
        SCProgressView* progressView = [[SCProgressView alloc] init];
        self.progressView = progressView;
        [self addSubview:progressView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        SCProgressView* progressView = [[SCProgressView alloc] init];
        self.progressView = progressView;
        self.progressView.frame = self.bounds;
        [self addSubview:self.progressView];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        SCProgressView* progressView = [[SCProgressView alloc] init];
        self.progressView = progressView;
        self.progressView.frame = self.bounds;
        [self addSubview:self.progressView];
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.progressView.frame = self.bounds;
}

- (void)setBackgroundImage:(UIImage *)backgroundImage{
    if (_backgroundImage != backgroundImage) {
        UIImage* scaleImage = [backgroundImage stretchableImageWithLeftCapWidth:self.frame.size.width topCapHeight:self.frame.size.height];
        _backgroundImage = backgroundImage;
        self.layer.contents = (id) scaleImage.CGImage;
    }
}

-(void)setProgress:(CGFloat)progress{
    self.progressView.progress = progress;
    _progress = progress;
    if (progress > 1.f) {
        [self.progressView removeFromSuperview];
        self.progressView = nil;
    }
}

-(void)setProgress:(CGFloat)progress withBlock:(SCImageViewProgressBlock)block{
    self.progress = progress;
    if (block) {
        block();
    }
}

@end
