//
//  MedioPagoViewController.h
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/20/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceManager.h"

@interface MedioPagoViewController : UIViewController <ServiceManagerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *medioPagoTableView;

@end
