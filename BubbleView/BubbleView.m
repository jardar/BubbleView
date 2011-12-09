//
//  BubbleView.m
//  BubbleView
//
//  Created by Joshua Buchacher on 12/7/11.
//  Copyright (c) 2011 Apple Inc. All rights reserved.
//

#import "BubbleView.h"
#define degreesToRadians(x) (M_PI * x / 180.0)

@implementation BubbleView
@synthesize buttons, mainButton, buttonPositions, buttonsAreShowing, animationDuration;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        buttonsAreShowing = FALSE;
        __strong buttonsAreShowing = buttonsAreShowing;
        [self populateButtonPositions];
        [self setupButtons];
    }
    return self;
}

/*
-(void)drawRect:(CGRect)rect
{
    CGContextRef context= UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextStrokeEllipseInRect(context, CGRectMake(10.0, 10.0, 100.0, 100.0));
    [self setNeedsDisplay];
}
*/

- (void)populateButtonPositions
{
    NSString *point1 = NSStringFromCGPoint(CGPointMake(40.0, -30.0));
    NSString *point2 = NSStringFromCGPoint(CGPointMake(65.0, -10.0));
    NSString *point3 = NSStringFromCGPoint(CGPointMake(75.0, 15.0));
    NSString *point4 = NSStringFromCGPoint(CGPointMake(65.0, 40.0));
    NSString *point5 = NSStringFromCGPoint(CGPointMake(40.0, 60.0));
    buttonPositions = [[NSArray alloc]initWithObjects:point1, point2, point3, point4, point5, nil];
    
}

- (void)setupButtons
{
    NSLog(@"Setting up buttons.");
    buttons = [[NSMutableArray alloc]init];
    mainButton = [[UIButton alloc]initWithFrame:CGRectMake((self.frame.origin.x+100), (self.frame.origin.y+100), 50.0, 50.0)];
    [mainButton setImage:[UIImage imageNamed:@"addButton.png"] forState:UIControlStateNormal];   
    [mainButton addTarget:self action:@selector(toggleShowHideButtons) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:mainButton];
                  
    void(^createSubButton)(UIButton *, NSString *)=^(UIButton *theButton, NSString *positionAdjustmentString) {
        
        theButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
        [theButton setFrame:CGRectMake(mainButton.center.x, mainButton.center.y, 18, 19)];
        [theButton setHidden:TRUE];
        [theButton setTransform:CGAffineTransformMakeRotation(M_PI)];
        [buttons addObject:theButton];
        [self addSubview:theButton];
    };
    
    UIButton *button1;
    UIButton *button2;
    UIButton *button3;
    UIButton *button4;
    UIButton *button5;
    
    createSubButton(button1, [buttonPositions objectAtIndex:0]);
    createSubButton(button2, [buttonPositions objectAtIndex:1]);
    createSubButton(button3, [buttonPositions objectAtIndex:2]);
    createSubButton(button4, [buttonPositions objectAtIndex:3]);
    createSubButton(button5, [buttonPositions objectAtIndex:4]);
    
    
    
}

- (void)toggleShowHideButtons
{
    animationDuration = 0.25;
    [self.superview bringSubviewToFront:mainButton];
    
    if (buttonsAreShowing == TRUE)
    {
        for (UIButton* theButton in buttons)
        {
            [UIView animateWithDuration:animationDuration animations:^{
                [theButton setCenter:mainButton.center];
                [theButton setAlpha:0.0];
                [theButton setTransform:CGAffineTransformMakeRotation(M_PI)];
            }];
            animationDuration = (animationDuration + 0.05);
        }
        [self.superview bringSubviewToFront:mainButton];
        buttonsAreShowing = FALSE;
    }
    else if (buttonsAreShowing == FALSE)
    {
        for (UIButton* theButton in buttons)
        {
            [theButton setHidden:FALSE];
            CGPoint positionAdjustmentValue = CGPointFromString([buttonPositions objectAtIndex:[buttons indexOfObject:theButton]]);
            [UIView animateWithDuration:animationDuration animations:^{
                [theButton setFrame:CGRectMake((mainButton.frame.origin.x + positionAdjustmentValue.x), (mainButton.frame.origin.y + positionAdjustmentValue.y), 18, 19)];
                [theButton setAlpha:1.0];
                [theButton setTransform:CGAffineTransformMakeRotation(0)];
        }];
        animationDuration = (animationDuration + 0.05);

    }

    buttonsAreShowing = TRUE;
    }
    
}




@end











