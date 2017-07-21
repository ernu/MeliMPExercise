//
//  ServiceManager.h
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/20/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestObject.h"

@protocol ServiceManagerDelegate <NSObject>

- (void)onResponseSuccess:(id)responseObject uri:(NSString *)uri;
- (void)onResponseFailure:(NSError *)error uri:(NSString *)uri;

@end

@interface ServiceManager : NSObject

@property (strong, nonatomic) id <ServiceManagerDelegate> delegate;

- (void)callGETService:(NSString *)baseUrl request:(RequestObject *)request;

@end
