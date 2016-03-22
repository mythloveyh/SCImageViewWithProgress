//
//  ViewController.m
//  ProgressDemo
//
//  Created by Digger on 16/3/12.
//  Copyright © 2016年 ppl. All rights reserved.
//

#import "ViewController.h"
#import "SCImageView.h"
@interface ViewController ()

@property (strong, nonatomic) SCImageView *imageView;

@end

@implementation ViewController

static float _progress = 0.1f;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage* img = [UIImage imageNamed:@"header.jpg"];
    self.imageView = [[SCImageView alloc] initWithImage:img];
    self.imageView.frame = CGRectMake(0, 0, 200, 200);
    self.imageView.center = self.view.center;
    [self.view addSubview:self.imageView];
    
    NSTimer* timer =  [NSTimer timerWithTimeInterval:1.f target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)updateProgress{
    _progress = _progress + 0.1f;
    self.imageView.progress = _progress;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
