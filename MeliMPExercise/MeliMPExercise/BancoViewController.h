//
//  BancoViewController.h
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/22/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceManager.h"
#import "MedioPago.h"

@interface BancoViewController : UIViewController <ServiceManagerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *bancoTableView;
@property (strong, nonatomic) IBOutlet UIView *noBancosView;

@property (strong, nonatomic) MedioPago *selectedMedioPago;

@end
