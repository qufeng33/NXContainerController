//
//  ContainerController.m
//  NXContainerControllerDemo
//
//  Created by 蒋瞿风 on 2017/9/23.
//  Copyright © 2017年 nightx. All rights reserved.
//

#import "ContainerController.h"

@interface ContainerController ()

@end

@implementation ContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self displayViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
