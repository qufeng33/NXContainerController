//
//  TransitionContext.h
//  laila-employee
//
//  Created by 蒋瞿风 on 16/3/9.
//  Copyright © 2016年 maitianer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModalAnimator.h"

@interface TransitionContext : NSObject <UIViewControllerContextTransitioning>

@property (nonatomic, copy) void (^completionBlock)(BOOL didComplete);
@property (nonatomic, assign, getter=isAnimated) BOOL animated;
@property (nonatomic, assign, getter=isInteractive) BOOL interactive;

- (instancetype)initWithFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController withAnimationType:(AnimationType)type;

@end
