//
//  DataView.h
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/19/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DataViewDelegate <NSObject>

- (void)onDataViewTapped:(int)typeId;

@end

@interface DataView : UIView

@property (strong, nonatomic) id <DataViewDelegate> delegate;

@property (strong, nonatomic) IBOutlet UILabel *datosLbl;
@property (strong, nonatomic) IBOutlet UIImageView *img;

- (id)initWithData:(NSString *)data img:(UIImage *)img typeId:(int)typeId;
+ (CGFloat)viewHeight;
- (void)setImgWithUrl:(NSString *)url;
- (void)setTapGestureActive:(BOOL)enable;

@end
