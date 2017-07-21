//
//  ServiceManager.m
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/20/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import "ServiceManager.h"
#import "AFNetworking.h"

@implementation ServiceManager

- (void)callGETService:(NSString *)baseUrl request:(RequestObject *)request {
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@", baseUrl, request.uri];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:request.dictionary progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [_delegate onResponseSuccess:responseObject uri:request.uri];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [_delegate onResponseFailure:error uri:request.uri];
        
    }];
    
}

@end
