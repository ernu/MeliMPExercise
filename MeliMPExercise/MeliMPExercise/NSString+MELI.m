//
//  NSString+MELI.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/23/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "NSString+MELI.h"

@implementation NSString (MELI)

+ (NSString *)formatNumberStringToThousandString:(NSString*)originalString {
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    [f setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    
    if ([f numberFromString:originalString] == nil) {
        return originalString;
    } else {
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setGroupingSeparator:@"."];
        [numberFormatter setGroupingSize:3];
        [numberFormatter setUsesGroupingSeparator:YES];
        [numberFormatter setDecimalSeparator:@","];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [numberFormatter setMaximumFractionDigits:2];
        [numberFormatter setMinimumFractionDigits:2];
        
        return [numberFormatter stringFromNumber:[f numberFromString:originalString]];
    }
}

@end
