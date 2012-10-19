//
//  ViewController.h
//  ColorSketch
//
//  Created by Puja Belwal on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NPColorPickerView.h"
#import "BrushPickerViewController.h"

@class PalleteViewController;
@class  ShapesPickerViewController;
@class CanvasView;
@class ShareViewController;

@interface ViewController : UIViewController<NPColorPickerViewDelegate>

@property(nonatomic, strong) UIPopoverController* palletesPopOver;
@property(strong, nonatomic) PalleteViewController* paletteVC;

@property(nonatomic, strong) UIPopoverController* colorPickerPopOver;
@property(strong, nonatomic)BrushPickerViewController* brushPickerVC;

@property(nonatomic, strong) UIPopoverController* shapesPickerPopOver;
@property(strong, nonatomic)ShapesPickerViewController* shapesPickerVC;

@property(nonatomic, strong)UIPopoverController* sharePopPver;
@property(nonatomic, strong)ShareViewController* shareVC;

@property (weak, nonatomic) IBOutlet CanvasView *canvas;



- (IBAction)PalletesButtonTapped:(id)sender;
- (IBAction)brushButtonTapped:(id)sender;

- (IBAction)shapesButtonTapped:(id)sender;
-(void)brushPicker:(BrushPickerViewController*)brushPicker didChangeSize:(CGFloat)size;

- (IBAction)clearScreen:(id)sender;
- (IBAction)shareButtonClicked:(id)sender;

@end
