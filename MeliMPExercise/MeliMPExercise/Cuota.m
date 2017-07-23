//
//  Cuota.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/22/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "Cuota.h"

@implementation Cuota

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (self = [super init]) {
        
        self.installments = [dictionary[@"installments"] intValue];
        self.msg = dictionary[@"recommended_message"];
    }
    return self;
}

+ (NSArray<Cuota *> *)dictArrayToModelArray:(NSArray *)dictArray {
    
    NSMutableArray<Cuota *> *cArray = [[NSMutableArray<Cuota *> alloc] init];
    
    if (dictArray.count > 0) {
        NSDictionary *dict = [dictArray objectAtIndex:0];
        NSArray *cuotasArray = dict[@"payer_costs"];
        
        for (NSDictionary *dict in cuotasArray) {
            Cuota *c = [[Cuota alloc] initWithDictionary:dict];
            [cArray addObject:c];
        }
    }
    
    return cArray;
}

@end
