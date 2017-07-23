//
//  MainViewController.h
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/19/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PagarViewController.h"

@interface MainViewController : UIViewController <PagarDelegate>

@property (strong, nonatomic) IBOutlet UIButton *pagarBtn;

@end
