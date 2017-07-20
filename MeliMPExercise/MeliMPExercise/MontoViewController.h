//
//  MontoViewController.h
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/20/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MontoViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *montoTf;
@property (strong, nonatomic) IBOutlet UIButton *confirmBtn;

@end
