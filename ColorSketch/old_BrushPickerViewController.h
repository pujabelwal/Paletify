//
//  BrushPickerViewController.h
//  ColorSketch
//
//  Created by Puja Belwal on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NPColorPickerView.h"


@interface BrushPickerViewController : UIViewController
@property (weak, nonatomic) IBOutlet NPColorPickerView *colorPickerView;
@property (weak, nonatomic) IBOutlet UISlider *sizeSlider;
@property(weak, nonatomic) id delegate;

- (IBAction)brushSizeChanged:(id)sender;
-(id)initWithDelegate:(id)delegateObject;
@end
