//
//  NXContainerController.h
//  NXContainerControllerDemo
//
//  Created by 蒋瞿风 on 16/3/11.
//  Copyright © 2016年 nightx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitionContext.h"

@interface NXContainerController : UIViewController

@property (strong, nonatomic, readonly) UIViewController *contentViewController;

/**
 *  添加一个ViewController替换contentViewController,无动画切换效果，会移除原来的contentViewController
 *
 *  @param viewController 新的contentViewController
 */
- (void)displayViewController:(UIViewController *)viewController;


/**
 *  将当前的contentViewController替换为到新的viewController
 *
 *  @param viewController 新的contentViewController
 *  @param type           切换的方式
 */
- (void)showViewController:(UIViewController *)viewController
         withAnimationType:(AnimationType)type;


@end
