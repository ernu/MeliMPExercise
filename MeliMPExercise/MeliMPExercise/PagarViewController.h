//
//  PagarViewController.h
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/19/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataView.h"
#import "MontoViewController.h"
#import "MedioPagoViewController.h"

@interface PagarViewController : UIViewController <DataViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *datosViewContainer;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *datosHeightConstraint;

@property (strong, nonatomic) NSString *selectedMonto;

@end
