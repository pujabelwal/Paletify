//
//  CLPalette.m
//  ColorLovers
//
//  Created by Puja Belwal on 5/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CLPalette.h"

@implementation CLPalette
@synthesize colors = _colors;
@synthesize imageUrl = _imageUrl;
@synthesize desc = _desc;
@synthesize title = _title;

-(NSString*)description{
    return [NSString stringWithFormat:@"title:%@ description:%@  colors:%@ imageURL:%@", self.title, self.desc, self.colors, self.imageUrl]; 
}
@end
