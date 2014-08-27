//
//  SKAuth.h
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/27/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^SKErrorBlock)(NSError *error);
typedef void (^SKSuccessBlock)();
@interface SKAuth : NSObject

@property(readonly) NSString* access_token;

+ (instancetype)sharedInstance;

- (void)authorizeWithLogin:(NSString *)login password:(NSString *)password scopes:(NSString *)scopes clientID:(NSString *)clientID clientSecret:(NSString *)clientSecret SKSuccessBlock:(SKSuccessBlock)successBlock SKErrorBlock:(SKErrorBlock)errorBlock;
@end
