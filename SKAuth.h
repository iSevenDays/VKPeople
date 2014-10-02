//
//  SKAuth.h
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/27/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKAuth : NSObject

- (NSURLRequest *)authorizeWithLogin:(NSString *)login password:(NSString *)password scopes:(NSString *)scopes clientID:(NSString *)clientID clientSecret:(NSString *)clientSecret successBlock:(void (^)(SKResponse *response))successBlock errorBlock:(SKErrorBlock)errorBlock;


@property(readonly) NSString *accessToken;

@end
