//
//  RequestObject.h
//  MeliMPExercise
//
//  Created by Ernesto Kim on 7/20/17.
//  Copyright © 2017 Ernesto Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestObject : NSObject

@property (strong, nonatomic) NSDictionary *dictionary;
@property (strong, nonatomic) NSString *uri;

@end
