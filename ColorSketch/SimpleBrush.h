//
//  SimpleBrush.h
//  ColorSketch
//
//  Created by Puja Belwal on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "drawing.h"

@interface SimpleBrush : NSObject<drawing>

@property(nonatomic, strong)UIBezierPath *path;
@property(nonatomic, assign)CGFloat size;
@property(nonatomic,strong)UIColor* color;


@end
