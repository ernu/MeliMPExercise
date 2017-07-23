//
//  CustomButton.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/23/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "CustomButton.h"
#import "UIColor+MELI.h"

@implementation CustomButton

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self.layer setCornerRadius:5.0];
        [self setBackgroundColor:[UIColor MELI_Blue]];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    }
    
    return self;
}

- (void)setEnabled:(BOOL)enabled {
    
    if (enabled) {
        [super setEnabled:true];
        [self setBackgroundColor:[UIColor MELI_Blue]];
    } else {
        [super setEnabled:false];
        [self setBackgroundColor:[UIColor MELI_LightGray]];
    }
    
}


@end
