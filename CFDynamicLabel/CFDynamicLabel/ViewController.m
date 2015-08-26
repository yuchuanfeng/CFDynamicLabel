//
//  ViewController.m
//  CFDynamicLabel
//
//  Created by 于 传峰 on 15/8/26.
//  Copyright (c) 2015年 于 传峰. All rights reserved.
//

#import "ViewController.h"
#import "CFDynamicLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    CFDynamicLabel* testLabel = [[CFDynamicLabel alloc] initWithFrame:CGRectMake(100, 300, 180, 21)];
    
    testLabel.speed = 0.6;
    [self.view addSubview:testLabel];
    
    testLabel.text = @"我不想说再见,不说再见,越长大越孤单";
    testLabel.textColor = [UIColor yellowColor];
    testLabel.font = [UIFont systemFontOfSize:23];
    testLabel.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
