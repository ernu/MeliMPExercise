//
//  CommonCell.h
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/21/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *typeImg;
@property (strong, nonatomic) IBOutlet UILabel *name;

+(CGFloat)cellHeight;
-(void)setData:(NSString *)name img:(NSString *)imgUrl;

@end
