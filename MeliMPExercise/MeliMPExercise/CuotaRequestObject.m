//
//  CuotaRequestObject.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/22/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "CuotaRequestObject.h"
#import "Constants.h"

@implementation CuotaRequestObject

- (id)initWithMedioPago:(MedioPago *)mp banco:(Banco *)banco monto:(NSString *)monto {
    
    if (self = [super init]){
        self.dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                           kPublicKey, @"public_key",
                           mp.methodId, @"payment_method_id",
                           banco.bancoId, @"issuer.id",
                           monto, @"amount",
                           nil];
        self.uri = kUriCuota;
    }
    
    return self;
}

@end
