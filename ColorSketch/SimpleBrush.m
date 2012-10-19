//
//  SimpleBrush.m
//  ColorSketch
//
//  Created by Puja Belwal on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SimpleBrush.h"

@implementation SimpleBrush
@synthesize path = _path;
@synthesize size = _size;
@synthesize color = _color;


-(void)draw{
    
    self.path.lineWidth = self.size;
    [self.color set];
    [self.path stroke];
}

@end
