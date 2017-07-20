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

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
    
}

- (void)callGETService:(NSString *)baseUrl request:(RequestObject *)request {
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@", baseUrl, request.uri];
    
//    for (NSString* key in params) {
//        NSString *value = [params objectForKey:key];
//        urlString = [NSString stringWithFormat:@"%@%@=%@&", urlString, key, value];
//    }
//    
//    if ([urlString length] > 0) {
//        urlString = [urlString substringToIndex:[urlString length] - 1];
//    }
    
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
