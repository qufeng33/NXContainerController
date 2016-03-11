//
//  SecondViewController.m
//  NXContainerControllerDemo
//
//  Created by 蒋瞿风 on 16/3/11.
//  Copyright © 2016年 nightx. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showVC:(UIButton *)sender{
    if ([sender.titleLabel.text isEqualToString: @"Present"]) {
        [(ViewController *)self.parentViewController showViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"] withAnimationType:AnimationTransitionPresent];
        return;
    }
    
    if ([sender.titleLabel.text isEqualToString:@"Dismiss"]) {
        [(ViewController *)self.parentViewController showViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"] withAnimationType:AnimationTransitionDismiss];
        return;
    }
}

@end
