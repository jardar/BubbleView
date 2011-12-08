//
//  BubbleView.m
//  BubbleView
//
//  Created by Joshua Buchacher on 12/7/11.
//  Copyright (c) 2011 Apple Inc. All rights reserved.
//

#import "BubbleView.h"

@implementation BubbleView
@synthesize buttons, mainButton, buttonPositions;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self populateButtonPositions];
        [self setupButtons];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)populateButtonPositions
{
    NSString *point1 = NSStringFromCGPoint(CGPointMake(30.0, -45.0));
    NSString *point2 = NSStringFromCGPoint(CGPointMake(55.0, -25.0));
    NSString *point3 = NSStringFromCGPoint(CGPointMake(65.0, 0.0));
    NSString *point4 = NSStringFromCGPoint(CGPointMake(55.0, 25.0));
    NSString *point5 = NSStringFromCGPoint(CGPointMake(30.0, 45.0));
    buttonPositions = [[NSArray alloc]initWithObjects:point1, point2, point3, point4, point5, nil];
    
}

- (void)setupButtons
{
    NSLog(@"Setting up buttons.");
    mainButton = [[UIButton alloc]initWithFrame:CGRectMake((self.frame.origin.x+10), (self.frame.origin.y+10), 50.0, 50.0)];
    [mainButton setImage:[UIImage imageNamed:@"addButton.png"] forState:UIControlStateNormal];     
    [self addSubview:mainButton];
                  
    void(^createSubButton)(UIButton *)=^(UIButton *theButton) {
        
        theButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
        
        
    };
    

    
    
}


@end
