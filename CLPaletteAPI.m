//
//  CLPaletteAPI.m
//  ColorLovers
//
//  Created by Puja Belwal on 5/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CLPaletteAPI.h"
#import "CLPalette.h"

@implementation CLPaletteAPI
@synthesize receivedData;
@synthesize palettes = _palettes;
@synthesize delegate = _delegate;

-(void)getNewPalettes{

    NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.colourlovers.com/api/palettes/new?hueOption=violet&format=json"]
                             cachePolicy:NSURLRequestUseProtocolCachePolicy
                             timeoutInterval:60.0];
    // create the connection with the request
    // and start loading the data
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    if (theConnection) {
        // Create the NSMutableData to hold the received data.
        // receivedData is an instance variable declared elsewhere.
        
        receivedData = [NSMutableData data];
    
    } else { 
        // Inform the user that the connection failed.
    }
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // This method is called when the server has determined that it
    // has enough information to create the NSURLResponse.
    
    // It can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    
    // receivedData is an instance variable declared elsewhere.
    [receivedData setLength:0]; 
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the new data to receivedData.
    // receivedData is an instance variable declared elsewhere.
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    // release the connection, and the data object
    // receivedData is declared as a method instance elsewhere
    
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    
    
    [self.delegate palettesDownloadFailed:self];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // do something with the data
    // receivedData is declared as a method instance elsewhere
    NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
    
    NSError *e = nil;
   id response =  [NSJSONSerialization JSONObjectWithData:receivedData options:0 error:&e];
    
    NSLog(@"Response=%@", response);
    if( [response isKindOfClass :[NSArray class]]){
       // NSLog(@"response:%@", [response objectAtIndex:1]);
        self.palettes = [[NSMutableArray alloc] init];
        
        for(NSDictionary *paletteInfo in response){
            CLPalette *aPalette = [[CLPalette alloc] init];
            aPalette.desc = [paletteInfo valueForKey:@"description"];
            aPalette.imageUrl = [paletteInfo valueForKey:@"imageUrl"];
            aPalette.colors = [paletteInfo objectForKey:@"colors"];
            aPalette.title = [paletteInfo objectForKey:@"title"];
            
            [self.palettes addObject:aPalette];
            
        }
      //  NSLog(@"All Palettes:%@", self.palettes);
        id del = self.delegate;
        if( [del respondsToSelector:@selector(palettesAvailable:palettes:)] ){
            [self.delegate palettesAvailable:self palettes:self.palettes];
        }
    }else{
        //if response is something wrong
         
    }
    
    // release the connection, and the data object
    
}

@end
