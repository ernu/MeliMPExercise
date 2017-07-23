//
//  CuotaViewController.h
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/22/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceManager.h"
#import "MedioPago.h"
#import "Banco.h"

@interface CuotaViewController : UIViewController <ServiceManagerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *cuotaTableView;

@property (strong, nonatomic) MedioPago *selectedMedioPago;
@property (strong, nonatomic) Banco *selectedBanco;
@property (strong, nonatomic) NSString *selectedMonto;

@end
