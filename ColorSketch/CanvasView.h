//
//  CustomView.h
//  DrawMailer
//
//  Created by Niraj Khatod on 2/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
@class SimpleBrush;
@class ShapeContainerView;

typedef enum {
    drawableElementTypeBrush,
    drawableElementTypeShape
} DrawableElementType;


@interface CanvasView : UIView {
	
}

@property(nonatomic, assign)DrawableElementType drawableElementType;
@property(strong)NSMutableArray *layers;
@property(strong)NSMutableArray *fgColors;
@property(assign)int layerIndex;
@property(strong)UIColor *currentFGColor;

@property(nonatomic, retain)SimpleBrush* currentBrush;
@property(nonatomic, assign)CGFloat currentBrushSize;

@property(nonatomic, weak)IBOutlet ShapeContainerView *shapeContainerView;

-(void) pushToBackground;
- (UIImage *)createImageFromContext;
- (void)clearScreen;
-(void)undo;

@end