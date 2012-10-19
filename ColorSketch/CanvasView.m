//
//  CustomView.m
//  DrawMailer
//
//  Created by Niraj Khatod on 2/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CanvasView.h"
#include <QuartzCore/QuartzCore.h>
#import "SimpleBrush.h"
#import "ShapeContainerView.h"
#import "drawing.h"


@implementation CanvasView
@synthesize layerIndex, fgColors, currentFGColor;
@synthesize layers = _layers;
@synthesize currentBrush = _currentBrush;
@synthesize currentBrushSize = _currentBrushSize;
@synthesize shapeContainerView = _shapeContainerView;
@synthesize drawableElementType = _drawableElementType;

/* 
 - (id)initWithFrame:(CGRect)frame {
 NSLog(@"initWithFrame - called");
 if ((self = [super initWithFrame:frame])) {
 NSLog(@"initWithFrame - called");
 self.currentFGColor = [ UIColor redColor ];
 }
 return self;
 }
 */


- (void)awakeFromNib{
    
    //Allocate layers array
    self.layers = [[NSMutableArray alloc]init];
    //Set initial drawing element to brush
    self.drawableElementType = drawableElementTypeBrush;
    
    self.currentFGColor = [UIColor redColor];   
    self.currentBrushSize = 2.0f;
    
}

//- (NSMutableArray *)layers{
//	if(layers == nil) layers = [[NSMutableArray alloc] init];
//    return layers;
//}
//
//- (NSMutableArray *)fgColors{
//	if(fgColors == nil) fgColors = [[NSMutableArray alloc] init];
//	return fgColors;
//}

      

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
 //   CGContextRef context = UIGraphicsGetCurrentContext();
      
    for(id<drawing>drawableObject in self.layers){
        [drawableObject draw];
    }
    
   // [self pushToBackground];
    
}

- (void) touchesBegan:(NSSet *) touches withEvent:(UIEvent *) event{
	
    //self.userInteractionEnabled = NO;
    
    CGPoint pt = [[touches anyObject] locationInView:self];
    NSLog(@"Touches Began at point %f %f", pt.x, pt.y);
   
    /*
    if(nil == self.shapeContainerView){
        
        [[NSBundle mainBundle] loadNibNamed:@"ShapeContainer" owner:self options:nil];
         
        CGRect frame = CGRectMake(pt.x, pt.y, 234, 234);
        self.shapeContainerView.frame = frame;
        
        [self addSubview:self.shapeContainerView];    
    }
    */
    
    
    //bezierPath is a factory method that returns an empty path
    self.currentBrush = [[SimpleBrush alloc] init];
    self.currentBrush.path = [UIBezierPath bezierPath];
    self.currentBrush.color = self.currentFGColor;
    self.currentBrush.size = self.currentBrushSize;
    
    //moveToPoint defines starting point of a path.
    [self.currentBrush.path moveToPoint:pt];
    
    //this line adds currentPath object into layers NSMutableArray.
    [self.layers addObject:self.currentBrush];
    [self setNeedsDisplay];
     
    
        
}
// Add each point to the correct array as the finger moves
- (void) touchesMoved:(NSSet *) touches withEvent:(UIEvent *) event{

    CGPoint pt = [[touches anyObject] locationInView:self];    
  //  NSLog(@"Touches moved to point %f %f", pt.x, pt.y);

   // CGPathAddLineToPoint(self.currentPath.CGPath, NULL, pt.x, pt.y);
    [self.currentBrush.path addLineToPoint:pt];
    [self setNeedsDisplay];    
}

- (void) touchesEnded:(NSSet *) touches withEvent:(UIEvent *) event{
		
    CGPoint pt = [[touches anyObject] locationInView:self];    
  //  NSLog(@"Touches ended at point %f %f", pt.x, pt.y);
    //CGPathAddLineToPoint(self.currentPath, NULL, pt.x, pt.y);
    [self.currentBrush.path addLineToPoint:pt];
    [self setNeedsDisplay];
 }

- (UIImage *)createImageFromContext{
	NSLog(@"createImageFromContext - dump view contents to image");
	CGRect contextRect = CGRectMake(0, 0, self.bounds.size.width,
									self.bounds.size.height);
	UIGraphicsBeginImageContext(contextRect.size);
	// get whatever the user drew in the view
	[self.layer renderInContext:UIGraphicsGetCurrentContext()];
	// create a new image with it
	UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return theImage;
}      


- (void) pushToBackground {
    
    UIImageView* backgroundImageView =  [ self.superview.subviews objectAtIndex:1];                                   
    //  UIGraphicsBeginImageContextWithOptions(backgroundImageView.bounds.size, NO, 2.0);
    UIGraphicsBeginImageContext(backgroundImageView.bounds.size);
	// get whatever the user drew in the view
	[ backgroundImageView.image drawAtPoint:CGPointMake(0,0)];
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
	
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    backgroundImageView.image = newImage;

} 
 
-(void)undo{
    
    
    
}
 

- (void)clearScreen{
	NSLog(@"cls - clear the screen");
	[self.layers removeAllObjects];	
	[self setNeedsDisplay];
}

@end
