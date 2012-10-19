//
//  ShapeContainerView.h
//  ColorSketch
//
//  Created by Puja Belwal on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShapeView.h"

@interface ShapeContainerView : UIView
@property (weak, nonatomic) ShapeView *shapeView;

- (void)handlePanGesture:(UIPanGestureRecognizer *)sender;

@end
