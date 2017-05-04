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

- (void)showViewController:(UIViewController *)viewController
         withAnimationType:(AnimationType)type
                  duration:(NSTimeInterval)duration
                completion:(void (^ _Nullable)(UIViewController * _Nonnull))completion{
    if (self.isTransiting) {
        return;
    }
    
    if (!self.contentViewController) {
        [self displayViewController:[[UIViewController alloc] init]];
    }
    
    [self.contentViewController willMoveToParentViewController:nil];
    [self addChildViewController:viewController];
    
    ModalAnimator *animator = [ModalAnimator animationWithType:type duration:duration];
    TransitionContext *transitionContext = [[TransitionContext alloc] initWithFromViewController:self.contentViewController toViewController:viewController withAnimationType:type];
    
    
    __weak __typeof(self)weakSelf = self;
    transitionContext.animated = YES;
    transitionContext.interactive = NO;
    transitionContext.completionBlock = ^(BOOL didComplete) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf.contentViewController.view removeFromSuperview];
        [strongSelf.contentViewController removeFromParentViewController];
        [viewController didMoveToParentViewController:strongSelf];
        _contentViewController = viewController;
        
        strongSelf.isTransiting = NO;
        if (completion) {
            completion(viewController);
        }
    };
    
    self.isTransiting = YES;
    [animator animateTransition:transitionContext];
}

@end
