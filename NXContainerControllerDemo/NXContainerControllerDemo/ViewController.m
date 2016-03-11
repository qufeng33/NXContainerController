//
//  ViewController.m
//  NXContainerControllerDemo
//
//  Created by 蒋瞿风 on 16/3/11.
//  Copyright © 2016年 nightx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self displayViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
