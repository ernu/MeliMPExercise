//
//  MedioPagoCell.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/21/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "MedioPagoCell.h"
#import "UIImageView+WebCache.h"

static CGFloat cellHeight = 60;

@implementation MedioPagoCell

- (id)init {
    
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
    
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    
    return self;
}

+ (CGFloat)cellHeight {
    return cellHeight;
}

- (void)setData:(MedioPago *)medioPago {
    
    _name.text = medioPago.name;
    [_typeImg sd_setImageWithURL:[NSURL URLWithString:medioPago.thumbnail] placeholderImage:nil];
    
}

@end
