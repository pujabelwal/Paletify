//
//  CLPaletteAPI.h
//  ColorLovers
//
//  Created by Puja Belwal on 5/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CLPaletteAPIDelegate;

@interface CLPaletteAPI : NSObject<NSURLConnectionDelegate>

@property(strong, nonatomic)NSMutableData *receivedData;
@property (strong, nonatomic)NSMutableArray *palettes;
@property (weak, nonatomic)id<CLPaletteAPIDelegate> delegate;

-(void)getNewPalettes;

@end
@protocol CLPaletteAPIDelegate

- (void)palettesAvailable:(CLPaletteAPI*)apiClient palettes:(NSArray*)palletes;
- (void)palettesDownloadFailed:(CLPaletteAPI*)apiClient;

@end