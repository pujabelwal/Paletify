//
//  PaletteCell.m
//  ColorSketch
//
//  Created by Puja Belwal on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PaletteCell.h"

@implementation PaletteCell
@synthesize color0;
@synthesize color1;
@synthesize color2;
@synthesize color3;
@synthesize color4;
@synthesize paletteTitle;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
