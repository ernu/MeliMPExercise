//
//  Banco.h
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/22/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Banco : NSObject

@property (strong, nonatomic) NSString *bancoId;
@property (strong, nonatomic) NSString *name;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

+ (NSArray<Banco *> *)dictArrayToModelArray:(NSArray *)dictArray;

@end

