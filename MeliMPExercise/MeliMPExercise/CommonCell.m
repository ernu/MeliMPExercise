//
//  CommonCell.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/21/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "CommonCell.h"
#import "UIImageView+WebCache.h"

static CGFloat cellHeight = 60;

@implementation CommonCell

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

-(void)setData:(NSString *)name img:(NSString *)imgUrl {
    
    _name.text = name;
    
    if (imgUrl != nil) {
        [_typeImg sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:nil];
    } else {
        [_typeImg removeFromSuperview];
    }
    
}

@end
