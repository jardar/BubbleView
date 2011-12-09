//
//  BubbleView.h
//  BubbleView
//
//  Created by Joshua Buchacher on 12/7/11.
//  Copyright (c) 2011 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BubbleView : UIView

@property (strong, nonatomic) NSMutableArray *buttons;
@property (strong, nonatomic) NSArray *buttonPositions;
@property (strong, nonatomic) UIButton *mainButton;
@property BOOL buttonsAreShowing;
@property float animationDuration;

- (void)setupButtons;
- (void)populateButtonPositions;
- (void)toggleShowHideButtons;

@end
