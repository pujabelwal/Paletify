/*
 Copyright 2012 NEOPIXL S.A. 
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */


#import <UIKit/UIKit.h>
#import "NPColorPickerView.h"
#import "NPColorQuadView.h"

@interface NPViewController : UIViewController 

@property (weak, nonatomic) IBOutlet NPColorPickerView *colorPickerView;
@property (weak, nonatomic) IBOutlet NPColorQuadView *colorQuadView;
@property (weak, nonatomic)id<NPColorPickerViewDelegate> delegate;

-(id)initWithDelegate:(id)delegateObject;
@end
