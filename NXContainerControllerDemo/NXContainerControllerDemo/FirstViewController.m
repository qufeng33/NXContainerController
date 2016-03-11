//
//  FirstViewController.m
//  NXContainerControllerDemo
//
//  Created by 蒋瞿风 on 16/3/11.
//  Copyright © 2016年 nightx. All rights reserved.
//

#import "FirstViewController.h"
#import "ViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

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
        [(ViewController *)self.parentViewController showViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"] withAnimationType:AnimationTransitionPresent];
        return;
    }
    
    if ([sender.titleLabel.text isEqualToString:@"Dismiss"]) {
        [(ViewController *)self.parentViewController showViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"] withAnimationType:AnimationTransitionDismiss];
        return;
    }
}

@end
