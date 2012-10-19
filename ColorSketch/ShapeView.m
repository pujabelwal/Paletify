//
//  ShapeView.m
//  ColorSketch
//
//  Created by Puja Belwal on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShapeView.h"

@implementation ShapeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)draw{
    // Drawing code
    //UIBezierPath path = [[UIBezierPath alloc]init];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    [[UIColor redColor] set];
    [path fill];
    [path stroke];
    
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self draw];
    
}


@end
