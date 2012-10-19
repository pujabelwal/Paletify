//
//  BrushPickerViewController.m
//  ColorSketch
//
//  Created by Puja Belwal on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BrushPickerViewController.h"
#import "ViewController.h"

@interface BrushPickerViewController ()

@end

@implementation BrushPickerViewController
@synthesize colorPickerView;
@synthesize sizeSlider;
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithDelegate:(id)delegateObject{
    
    self = [super init];
    if(self){
        self.delegate = delegateObject;
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.colorPickerView.delegate = self.delegate;
}

- (void)viewDidUnload
{
    [self setColorPickerView:nil];
    [self setSizeSlider:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}




- (IBAction)brushSizeChanged:(id)sender {
    CGFloat newBrushSize = self.sizeSlider.value;
    [self.delegate brushPicker:self didChangeSize:newBrushSize];
    
}
@end
