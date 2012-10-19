//
//  PaletteCell.h
//  ColorSketch
//
//  Created by Puja Belwal on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaletteCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *color0;
@property (weak, nonatomic) IBOutlet UIView *color1;
@property (weak, nonatomic) IBOutlet UIView *color2;
@property (weak, nonatomic) IBOutlet UIView *color3;
@property (weak, nonatomic) IBOutlet UIView *color4;
@property (weak, nonatomic) IBOutlet UILabel *paletteTitle;

@end
