//
//  TransitionContext.m
//  laila-employee
//
//  Created by 蒋瞿风 on 16/3/9.
//  Copyright © 2016年 maitianer. All rights reserved.
//

#import "TransitionContext.h"

@interface TransitionContext ()

@property (strong, nonatomic) NSDictionary             *privateViewControllers;
@property (strong, nonatomic) NSDictionary             *privateViews;
@property (assign, nonatomic) CGRect                   privateVisibleRect;
@property (assign, nonatomic) CGRect                   privateUnvisibleRect;
@property (weak  , nonatomic) UIView                   *containerView;
@property (assign, nonatomic) AnimationType            type;

@end

@implementation TransitionContext

- (instancetype)initWithFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController withAnimationType:(AnimationType)type{
    NSAssert ([fromViewController isViewLoaded] && fromViewController.view.superview, @"The fromViewController view must reside in the container view upon initializing the transition context.");
    if (self = [super init]) {
        self.containerView = fromViewController.view.superview;
        self.privateViewControllers = @{
                                        UITransitionContextFromViewControllerKey:fromViewController,
                                        UITransitionContextToViewControllerKey:toViewController,
                                        };
        self.privateViews = @{
                              UITransitionContextFromViewKey:
                                  fromViewController.view,
                              UITransitionContextToViewKey:
                                  toViewController.view
                              };
        
        self.privateVisibleRect = self.containerView.bounds;
        self.privateUnvisibleRect = CGRectMake(0, self.containerView.bounds.size.height, self.containerView.bounds.size.width, self.containerView.bounds.size.height);
        
    }
    return self;
}

- (CGAffineTransform)targetTransform{
    return self.targetTransform;
}

- (UIModalPresentationStyle)presentationStyle{
    return UIModalPresentationNone;
}

- (UIViewController *)viewControllerForKey:(NSString *)key{
    return self.privateViewControllers[key];
}

- (UIView *)viewForKey:(NSString *)key{
    return self.privateViews[key];
}

- (CGRect)initialFrameForViewController:(UIViewController *)vc{
    //fromVC的位置均统一为默认位置
    if (vc == [self.privateViewControllers objectForKey:UITransitionContextFromViewControllerKey]) {
        return self.containerView.bounds;
    }
    //toVC的位置根据弹出还是缩回，初始的位置有不同
    if (self.type == AnimationTransitionDismiss) {
        return self.privateVisibleRect;
    }
    return self.privateUnvisibleRect;
}

- (CGRect)finalFrameForViewController:(UIViewController *)vc{
    //toVC的位置均统一为覆盖至原位置
    if (vc == [self.privateViewControllers objectForKey:UITransitionContextToViewControllerKey]) {
        return self.containerView.bounds;
    }
    //toVC的位置根据弹出还是缩回，初始的位置有不同
    if (self.type == AnimationTransitionDismiss) {
        return self.privateUnvisibleRect;
    }
    return self.privateVisibleRect;
}

- (void)completeTransition:(BOOL)didComplete{
    if (self.completionBlock) {
        self.completionBlock (didComplete);
    }
}

- (BOOL)transitionWasCancelled{
    return NO;
}
- (void)updateInteractiveTransition:(CGFloat)percentComplete {}
- (void)finishInteractiveTransition {}
- (void)cancelInteractiveTransition {}

@end
