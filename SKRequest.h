//
//  SKRequest.h
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/28/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKRequest : NSObject

typedef void (^SKSuccessBlock)(SKResponse*);
typedef void (^SKErrorBlock)(SKResponse*);

+ (void)requestDataByURL:(NSString *)url successBlock:(void (^)(SKResponse *response, NSArray *objects))successBlock errorBlock:(SKErrorBlock)errorBlock;

+ (void)requestDataFromVkMethod:(NSString *)method params:(NSDictionary *)params successBlock:(void (^)(SKResponse *response ,NSArray *objects))successBlock errorBlock:(SKErrorBlock)errorBlock;

@end
