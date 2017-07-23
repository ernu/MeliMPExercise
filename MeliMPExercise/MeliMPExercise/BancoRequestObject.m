//
//  BancoRequestObject.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/22/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "BancoRequestObject.h"
#import "Constants.h"

@implementation BancoRequestObject

- (id)initWithMedioPago:(MedioPago *)mp {
    
    if (self = [super init]){
        self.dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                           kPublicKey, @"public_key",
                           mp.methodId, @"payment_method_id",
                           nil];
        self.uri = kUriBanco;
    }
    
    return self;
}

@end
