//
//  CuotaRequestObject.h
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/22/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestObject.h"
#import "MedioPago.h"
#import "Banco.h"

@interface CuotaRequestObject : RequestObject

- (id)initWithMedioPago:(MedioPago *)mp banco:(Banco *)banco monto:(NSString *)monto;

@end
