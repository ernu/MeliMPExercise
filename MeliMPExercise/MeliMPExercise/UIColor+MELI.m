//
//  UIColor+MELI.m
//  MeliMPExercise
//
//  Created by Darwin Garcia on 2/8/16.
//  Copyright © 2016 AW Software SRL. All rights reserved.
//

#import "UIColor+MELI.h"

@implementation UIColor (MELI)

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
                      withAlpha:(float)alpha
{
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hex;
    if (![scanner scanHexInt:&hex]) return nil;
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:alpha];
}

+ (UIColor *)MELI_DarkGray
{
    return [UIColor colorWithRed:71.0f/255.0f
                           green:75.0f/255.0f
                            blue:80.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor *)MELI_LightGray
{
    return [UIColor colorWithRed:204.0f/255.0f
                           green:204.0f/255.0f
                            blue:204.0f/255.0f
                           alpha:1.0f];
}

+ (UIColor *)MELI_Blue
{
    return [UIColor colorWithRed:45.0f/255.0f
                           green:51.0f/255.0f
                            blue:119.0f/255.0f
                           alpha:1.0f];
}


+ (UIColor *)MELI_Yellow
{
    return [UIColor colorWithRed:255.0f/255.0f
                           green:241.0f/255.0f
                            blue:77.0f/255.0f
                           alpha:1.0f];
}


@end
