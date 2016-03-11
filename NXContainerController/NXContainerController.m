//
//  NXContainerController.m
//  NXContainerControllerDemo
//
//  Created by 蒋瞿风 on 16/3/11.
//  Copyright © 2016年 nightx. All rights reserved.
//

#import "NXContainerController.h"

@interface NXContainerController ()

@property (assign, nonatomic) BOOL isTransiting;

@end

@implementation NXContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)displayViewController:(UIViewController *)viewController{
    if (viewController) {
        [self removeAllChildViewControllers];
        [self addChildViewController:viewController];
        [self.view addSubview:viewController.view];
        [viewController didMoveToParentViewController:self];
        _contentViewController = viewController;
    }
}

- (void)removeAllChildViewControllers{
    for (UIViewController *vc in self.childViewControllers) {
        [vc willMoveToParentViewController:nil];
        [vc removeFromParentViewController];
    }
}

- (void)showViewController:(UIViewController *)viewController withAnimationType:(AnimationType)type{
    if (self.isTransiting) {
        return;
    }
    
    if (!self.contentViewController) {
        [self displayViewController:[[UIViewController alloc] init]];
    }
    
    [self.contentViewController willMoveToParentViewController:nil];
    [self addChildViewController:viewController];
    
    ModalAnimator *animator = [ModalAnimator animationWithType:type duration:0.6];
    TransitionContext *transitionContext = [[TransitionContext alloc] initWithFromViewController:self.contentViewController toViewController:viewController withAnimationType:type];
    
    transitionContext.animated = YES;
    transitionContext.interactive = NO;
    transitionContext.completionBlock = ^(BOOL didComplete) {
        [self.contentViewController.view removeFromSuperview];
        [self.contentViewController removeFromParentViewController];
        [viewController didMoveToParentViewController:self];
        _contentViewController = viewController;
        
        self.isTransiting = NO;
    };
    
    self.isTransiting = YES;
    [animator animateTransition:transitionContext];
}

@end
