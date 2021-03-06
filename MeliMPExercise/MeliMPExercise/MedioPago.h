//
//  MedioPago.h
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/20/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MedioPago : NSObject

@property (strong, nonatomic) NSString *methodId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *thumbnail;
@property (strong, nonatomic) NSString *paymentTypeId;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

+ (NSArray<MedioPago *> *)dictArrayToModelArrayCreditCard:(NSArray *)dictArray;

@end
