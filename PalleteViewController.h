//
//  PalleteViewController.h
//  ColorSketch
//
//  Created by Puja Belwal on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLPaletteAPI.h"

@interface PalleteViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,CLPaletteAPIDelegate,UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *paletteTable;
- (IBAction)getNewPalletes:(id)sender;
@property (weak, nonatomic) UIButton *getTopPalletes;

@property (strong, nonatomic)NSArray *palettes;

@property (strong, nonatomic)NSMutableArray *pickerColors;
@property (weak, nonatomic) IBOutlet UIPickerView *colorPickerView;


@end