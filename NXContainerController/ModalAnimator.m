//
//  ModalAnimator.m
//  laila-employee
//
//  Created by 蒋瞿风 on 16/3/8.
//  Copyright © 2016年 maitianer. All rights reserved.
//

#import "ModalAnimator.h"

@interface ModalAnimator ()

@property (assign, nonatomic) AnimationType  type;
@property (assign, nonatomic) NSTimeInterval duration;

@end

@implementation ModalAnimator

+ (ModalAnimator *)animationWithType:(AnimationType)type duration:(NSTimeInterval)duration{
    ModalAnimator *animator = [[ModalAnimator alloc] init];
    animator.type           = type;
    animator.duration       = duration;
    return animator;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    switch (self.type) {
        case AnimationTransitionPresent: {
            [self present:transitionContext];
            break;
        }
        case AnimationTransitionDismiss: {
            [self dismiss:transitionContext];
            break;
        }
    }
}

- (void)present:(id<UIViewControllerContextTransitioning>)transitionContext{
    // 1. Get controllers from transition context
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. Set init frame for toVC
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
    
    // 3. Add toVC's view to containerView
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    // 4. Do animate now
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         toVC.view.frame = finalFrame;
                     } completion:^(BOOL finished) {
                         // 5. Tell context that we completed.
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)dismiss:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. Set init frame for fromVC
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect initFrame = [transitionContext initialFrameForViewController:fromVC];
    CGRect finalFrame = CGRectOffset(initFrame, 0, screenBounds.size.height);
    
    // 3. Add target view to the container, and move it to back.
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView sendSubviewToBack:toVC.view];
    
    // 4. Do animate now
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        fromVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
