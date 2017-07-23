//
//  DataView.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/19/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "DataView.h"
#import "UIColor+MELI.h"
#import "UIImageView+WebCache.h"

@interface DataView() {
    UITapGestureRecognizer *tapGesture;
}

@property (nonatomic) int typeId;

@end

@implementation DataView

static CGFloat viewHeight = 50;

- (id)initWithData:(NSString *)data img:(UIImage *)img typeId:(int)typeId {
    
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
    self.translatesAutoresizingMaskIntoConstraints = false;
    
    if (self) {
        
        [self.layer setBorderWidth:1.0];
        [self.layer setBorderColor:[UIColor MELI_DarkGray].CGColor];
        [self.layer setCornerRadius:5.0];
        _datosLbl.text = data;
        _typeId = typeId;
        
        if (img) {
            [_img setImage:img];
        } else {
            [_img setHidden:true];
        }
        
        tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
        [self addGestureRecognizer:tapGesture];
        
    }
    
    return self;
}

- (void)handleTap {
    [_delegate onDataViewTapped:_typeId];
}

+ (CGFloat)viewHeight {
    return viewHeight;
}

- (void)setImgWithUrl:(NSString *)url {
    [_img setHidden:false];
    [_img sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
}

- (void)setTapGestureActive:(BOOL)enable {
    if (enable) {
        [self addGestureRecognizer:tapGesture];
        [self setBackgroundColor:[UIColor whiteColor]];
    } else {
        [self removeGestureRecognizer:tapGesture];
        [self setBackgroundColor:[UIColor MELI_LightGray]];
    }
}

@end
