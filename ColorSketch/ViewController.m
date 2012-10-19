//
//  ViewController.m
//  ColorSketch
//
//  Created by Puja Belwal on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "PalleteViewController.h"
#import "ShapesPickerViewController.h"
#import "ShareViewController.h"
#import "CanvasView.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize palletesPopOver = _palletesPopOver;
@synthesize paletteVC = _paletteVC;
@synthesize colorPickerPopOver = _colorPickerPopOver;
@synthesize brushPickerVC = _brushPickerVC;
@synthesize shapesPickerPopOver = _shapesPickerPopOver;
@synthesize shapesPickerVC = _shapesPickerVC;
@synthesize sharePopPver = _sharePopPver;
@synthesize shareVC = _shareVC;

@synthesize canvas = _canvas;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)viewDidUnload
{
    [self setCanvas:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)PalletesButtonTapped:(id)sender {
    if(self.palletesPopOver == nil){
        self.paletteVC = [[PalleteViewController alloc] init];
        
        self.palletesPopOver = [[UIPopoverController alloc] initWithContentViewController:self.paletteVC];
    }
    if(self.palletesPopOver.popoverVisible == NO){
        [self.palletesPopOver presentPopoverFromBarButtonItem:sender
                                     permittedArrowDirections:UIPopoverArrowDirectionAny animated:NO];
    }
    else{
        [self.palletesPopOver dismissPopoverAnimated:YES];
    }
    
   
    
}


- (IBAction)brushButtonTapped:(id)sender {
    
    
    
    if(self.colorPickerPopOver == nil){
        self.brushPickerVC = [[ BrushPickerViewController alloc]initWithDelegate:self];
        
        // self.NPcolorPickerVC.colorPickerView.delegate = self;
        self.colorPickerPopOver = [[UIPopoverController alloc] initWithContentViewController:self.brushPickerVC];
    }
    
    if(self.colorPickerPopOver.popoverVisible == NO){
        
        [self.colorPickerPopOver presentPopoverFromBarButtonItem:sender
                                        permittedArrowDirections:UIPopoverArrowDirectionAny animated:NO];
    }else {
        [self.colorPickerPopOver dismissPopoverAnimated:YES];
    }
    
    
}

- (IBAction)shapesButtonTapped:(id)sender {
    
    if(self.shapesPickerVC == nil){
        self.shapesPickerVC = [[ ShapesPickerViewController alloc]init];
        
        self.shapesPickerPopOver = [[UIPopoverController alloc] initWithContentViewController:self.shapesPickerVC];
    }
    
    if(self.shapesPickerPopOver.popoverVisible == NO){
        
        [self.shapesPickerPopOver presentPopoverFromBarButtonItem:sender
                                        permittedArrowDirections:UIPopoverArrowDirectionAny animated:NO];
    }else {
        [self.shapesPickerPopOver dismissPopoverAnimated:YES];
    }

    
}


-(void)NPColorPickerView:(NPColorPickerView *)view didSelectColor:(UIColor *)color {
    //[[self colorQuadView] pushColor:color];
    //set color for canvas
  //  [self.NPcolorPickerVC.colorQuadView pushColor:color];
    NSLog(@"Will Change canvas's color to Selected Color : %@", color);
    self.canvas.currentFGColor = color;
}

-(void)brushPicker:(BrushPickerViewController*)brushPicker didChangeSize:(CGFloat)size{
    
    NSLog(@"New Brush Size : %f", size);
    self.canvas.currentBrushSize = size;
}

- (IBAction)clearScreen:(id)sender {
    [self.canvas clearScreen];

}

- (IBAction)shareButtonClicked:(id)sender {
    if(self.shareVC == nil){
        self.shareVC = [[ ShareViewController alloc]init];
        
        self.sharePopPver = [[UIPopoverController alloc] initWithContentViewController:self.shareVC];
    }
    
    if(self.sharePopPver.popoverVisible == NO){
        
        [self.sharePopPver presentPopoverFromBarButtonItem:sender
                                         permittedArrowDirections:UIPopoverArrowDirectionAny animated:NO];
    }else {
        [self.sharePopPver dismissPopoverAnimated:YES];
    }
    
}


@end
