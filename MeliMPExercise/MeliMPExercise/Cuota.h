//
//  Cuota.h
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/22/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cuota : NSObject

@property (nonatomic) int installments;
@property (strong, nonatomic) NSString *msg;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

+ (NSArray<Cuota *> *)dictArrayToModelArray:(NSArray *)dictArray;

@end
