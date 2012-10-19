//
//  PalleteViewController.m
//  ColorSketch
//
//  Created by Puja Belwal on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PalleteViewController.h"
#import "CLPalette.h"
#import "PaletteCell.h"

@interface PalleteViewController ()

@end

@implementation PalleteViewController
@synthesize getTopPalletes;
@synthesize paletteTable;
@synthesize palettes = _palettes;
@synthesize colorPickerView = _colorPickerView;
@synthesize pickerColors = _pickerColors;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.pickerColors =[NSArray arrayWithObjects:@"Red", @"Orange", @"Pink", @"Violet", @"Blue", @"Magenta", @"Green", @"Brown", nil];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.paletteTable registerNib:[UINib nibWithNibName:@"Palette" bundle:nil]forCellReuseIdentifier:@"PaletteCellIdentifier"] ;

   
}

- (void)viewDidUnload
{
    [self setPaletteTable:nil];
    [self setGetTopPalletes:nil];
    [self setColorPickerView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)getNewPalletes:(id)sender {
    CLPaletteAPI *newPalettes = [[CLPaletteAPI alloc]init];
    newPalettes.delegate = self;
    
    //[self.colorPickerView selectedRowInComponent:0];
    
    [newPalettes getNewPalettes];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *myIdentifier = @"PaletteCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myIdentifier];
    
    CLPalette *colorPalette = [self.palettes objectAtIndex:indexPath.row];
    
    //configure cell
    [[(PaletteCell *)cell paletteTitle] setText:colorPalette.title];
    
    int numOfColors = [colorPalette.colors count];
    
    if(numOfColors<=2){
        [[(PaletteCell *)cell color0] setBackgroundColor:[PalleteViewController colorWithHexString:[colorPalette.colors objectAtIndex:0]]];
        [[(PaletteCell *)cell color1] setBackgroundColor:[PalleteViewController colorWithHexString:[colorPalette.colors objectAtIndex:1]]];
    }
    else if (numOfColors<=3) {
        [[(PaletteCell *)cell color0] setBackgroundColor:[PalleteViewController colorWithHexString:[colorPalette.colors objectAtIndex:0]]];
        [[(PaletteCell *)cell color1] setBackgroundColor:[PalleteViewController colorWithHexString:[colorPalette.colors objectAtIndex:1]]];
        [[(PaletteCell *)cell color2] setBackgroundColor:[PalleteViewController colorWithHexString:[colorPalette.colors objectAtIndex:2]]];
    }
        else if (numOfColors<=4) {
            [[(PaletteCell *)cell color0] setBackgroundColor:[PalleteViewController colorWithHexString:[colorPalette.colors objectAtIndex:0]]];
            [[(PaletteCell *)cell color1] setBackgroundColor:[PalleteViewController colorWithHexString:[colorPalette.colors objectAtIndex:1]]];
            [[(PaletteCell *)cell color2] setBackgroundColor:[PalleteViewController colorWithHexString:[colorPalette.colors objectAtIndex:2]]];
            [[(PaletteCell *)cell color3] setBackgroundColor:[PalleteViewController colorWithHexString:[colorPalette.colors objectAtIndex:3]]];
        }
        else if(numOfColors<=5){
            [[(PaletteCell *)cell color0] setBackgroundColor:[PalleteViewController colorWithHexString:[colorPalette.colors objectAtIndex:0]]];
            [[(PaletteCell *)cell color1] setBackgroundColor:[PalleteViewController colorWithHexString:[colorPalette.colors objectAtIndex:1]]];
            [[(PaletteCell *)cell color2] setBackgroundColor:[PalleteViewController colorWithHexString:[colorPalette.colors objectAtIndex:2]]];
            [[(PaletteCell *)cell color3] setBackgroundColor:[PalleteViewController colorWithHexString:[colorPalette.colors objectAtIndex:3]]];
            [[(PaletteCell *)cell color4] setBackgroundColor:[PalleteViewController colorWithHexString:[colorPalette.colors objectAtIndex:4]]];
        }
        
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"number of row in single tab: %d",self.palettes.count);
    return self.palettes.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 68.0;
}


- (void)palettesAvailable:(CLPaletteAPI*)apiClient palettes:(NSArray*)palletes{
    
    NSLog(@"palettes downloaded and palettes are:%@", palletes);
    self.palettes = palletes;
    [self.paletteTable reloadData];
    
}

- (void)palettesDownloadFailed:(CLPaletteAPI*)apiClient{
    
    NSLog(@"downloading failed!");
    
}

+ (UIColor *)colorWithHexString:(NSString *)str {
    const char *cStr = [str cStringUsingEncoding:NSASCIIStringEncoding];
    long x = strtol(cStr, NULL, 16);
    return [PalleteViewController colorWithHex:x];
}

// takes 0x123456
+ (UIColor *)colorWithHex:(UInt32)col {
    unsigned char r, g, b;
    b = col & 0xFF;
    g = (col >> 8) & 0xFF;
    r = (col >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1];
}

#pragma mark - UIPickerView methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;   
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return 8;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [self.pickerColors objectAtIndex:row];
}




@end
