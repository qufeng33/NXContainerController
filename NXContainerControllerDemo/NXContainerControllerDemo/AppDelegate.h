//
//  AppDelegate.h
//  NXContainerControllerDemo
//
//  Created by 蒋瞿风 on 16/3/11.
//  Copyright © 2016年 nightx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContainerController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic, readonly) ContainerController *containerController;

+ (AppDelegate *)sharedDelegate;

@end

