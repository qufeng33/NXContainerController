//
//  ModalAnimator.h
//  laila-employee
//
//  Created by 蒋瞿风 on 16/3/8.
//  Copyright © 2016年 maitianer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AnimationType) {
    AnimationTransitionPresent,         //从下往上弹出
    AnimationTransitionDismiss          //从上往下缩回
};

@interface ModalAnimator : NSObject <UIViewControllerAnimatedTransitioning>

+ (ModalAnimator *)animationWithType:(AnimationType)type
                            duration:(NSTimeInterval)duration;

@end
