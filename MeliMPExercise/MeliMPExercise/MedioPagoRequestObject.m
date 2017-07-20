//
//  MedioPagoRequestObject.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/20/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "MedioPagoRequestObject.h"
#import "Constants.h"

@implementation MedioPagoRequestObject

- (id)init {
    
    if (self = [super init]){
        self.dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:kPublicKey, @"public_key", nil];
        self.uri = kUriMedioPago;
    }
    
    return self;
}

@end
