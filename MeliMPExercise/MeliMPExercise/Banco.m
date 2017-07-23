//
//  Banco.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/22/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "Banco.h"

@implementation Banco

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (self = [super init]) {
        
        self.bancoId = dictionary[@"id"];
        self.name = dictionary[@"name"];
    }
    return self;
}

+ (NSArray<Banco *> *)dictArrayToModelArray:(NSArray *)dictArray {
    
    NSMutableArray<Banco *> *bArray = [[NSMutableArray<Banco *> alloc] init];
    
    for (NSDictionary *dict in dictArray) {
        Banco *b = [[Banco alloc] initWithDictionary:dict];
        [bArray addObject:b];
    }
    
    return bArray;
}

@end
