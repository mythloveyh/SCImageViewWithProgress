//
//  SCImageView.h
//  ProgressDemo
//
//  Created by Digger on 16/3/12.
//  Copyright © 2016年 ppl. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SCImageViewProgressBlock)();

@interface SCImageView : UIView

@property (nonatomic,assign) CGFloat progress;


-(void)setProgress:(CGFloat)progress withBlock:(SCImageViewProgressBlock) block;

- (instancetype)initWithImage:(UIImage*) image;

@end
