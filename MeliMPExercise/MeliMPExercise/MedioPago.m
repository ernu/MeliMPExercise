//
//  MedioPago.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/20/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "MedioPago.h"

@implementation MedioPago

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (self = [super init]) {
        self.methodId = dictionary[@"id"];
        self.name = dictionary[@"name"];
        self.thumbnail = dictionary[@"thumbnail"];
    }
    return self;
}

+ (NSArray<MedioPago *> *) dictArrayToModelArray:(NSArray *)dictArray {
    
    NSMutableArray<MedioPago *> *mpArray = [[NSMutableArray<MedioPago *> alloc] init];
    
    for (NSDictionary *dict in dictArray) {
        MedioPago *mp = [[MedioPago alloc] initWithDictionary:dict];
        [mpArray addObject:mp];
    }
    
    return mpArray;
}

@end
