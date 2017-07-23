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
#import "BancoViewController.h"
#import "CuotaViewController.h"
#import "MedioPago.h"
#import "Banco.h"
#import "Cuota.h"

@interface PagarViewController : UIViewController <DataViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *datosViewContainer;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *datosHeightConstraint;
@property (strong, nonatomic) IBOutlet UIButton *confirmBtn;

@property (strong, nonatomic) NSString *selectedMonto;
@property (strong, nonatomic) MedioPago *selectedMedioPago;
@property (strong, nonatomic) Banco *selectedBanco;
@property (strong, nonatomic) Cuota *selectedCuota;

@end
