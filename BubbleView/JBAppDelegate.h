//
//  JBAppDelegate.h
//  BubbleView
//
//  Created by Joshua Buchacher on 12/7/11.
//  Copyright (c) 2011 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JBViewController;

@interface JBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) JBViewController *viewController;

@end
