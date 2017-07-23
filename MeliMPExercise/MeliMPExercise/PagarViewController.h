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
#import "CustomButton.h"

@protocol PagarDelegate <NSObject>

- (void)onDataConfirmed:(NSString *)monto medioPago:(MedioPago *)medioPago banco:(Banco *)banco cuota:(Cuota *)cuota;

@end

@interface PagarViewController : UIViewController <DataViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *datosViewContainer;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *datosHeightConstraint;
@property (strong, nonatomic) IBOutlet CustomButton *confirmBtn;

@property (strong, nonatomic) id <PagarDelegate> delegate;
@property (strong, nonatomic) NSString *selectedMonto;
@property (strong, nonatomic) MedioPago *selectedMedioPago;
@property (strong, nonatomic) Banco *selectedBanco;
@property (strong, nonatomic) Cuota *selectedCuota;

@end
