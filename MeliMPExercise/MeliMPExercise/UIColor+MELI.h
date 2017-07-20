//
//  UIColor+MELI.h
//  MeliMPExercise
//
//  Created by Darwin Garcia on 2/8/16.
//  Copyright © 2016 AW Software SRL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MELI)

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
                      withAlpha:(float)alpha;
+ (UIColor *)MELI_DarkGray;
+ (UIColor *)MELI_LightGray;
+ (UIColor *)MELI_Blue;
+ (UIColor *)MELI_Yellow;

@end
