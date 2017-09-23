//
//  NXContainerController.h
//  NXContainerControllerDemo
//
//  Created by 蒋瞿风 on 16/3/11.
//  Copyright © 2016年 nightx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitionContext.h"

NS_ASSUME_NONNULL_BEGIN

@interface NXContainerController : UIViewController

@property (nonatomic, readonly) UIViewController *contentViewController;

/**
 添加一个ViewController替换contentViewController,无动画切换效果，会移除原来的contentViewController

 @param viewController 新的contentViewController
 */
- (void)displayViewController:(UIViewController *)viewController;

/**
 将当前的contentViewController替换为到新的viewController

 @param viewController 新的contentViewController
 @param type 切换的方式
 @param duration 切换效果持续时间
 @param completion 切换成功后的回调
 */
- (void)showViewController:(UIViewController *)viewController
         withAnimationType:(AnimationType)type
                  duration:(NSTimeInterval)duration
                completion:(void (^ __nullable)(UIViewController *controller))completion;

NS_ASSUME_NONNULL_END

@end
