//
//  ShapeContainerView.m
//  ColorSketch
//
//  Created by Puja Belwal on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShapeContainerView.h"

@implementation ShapeContainerView
@synthesize shapeView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
            }
    return self; 
}

- (void)awakeFromNib{
    // Initialization code
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handlePanGesture:)];
    
    [panGesture setMinimumNumberOfTouches:1];
	[panGesture setMaximumNumberOfTouches:1];
    
    [self addGestureRecognizer:panGesture];
    NSLog(@"Pan gesture recognizer added");
    
    
  //  UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];

    //[self addGestureRecognizer:tapGesture];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)handleTapGesture:(UITapGestureRecognizer *)sender{
    NSLog(@"Tap Gesture recognized");
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)sender{
    
    static CGFloat firstX = 0;
    static CGFloat firstY = 0;
    
    NSLog(@"Pan Gesture recognized: state: %@", sender);
    CGPoint translatedPoint = [sender translationInView:self.superview];
    
    
    if(sender.state == UIGestureRecognizerStateBegan ){
        firstX = [[sender view] center].x;
        firstY = [[sender view] center].y;
        
    }
    
    translatedPoint = CGPointMake(firstX+translatedPoint.x, firstY+translatedPoint.y);
    
    self.center = translatedPoint;
    
  }


@end
