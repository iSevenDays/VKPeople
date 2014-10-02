//
//  SKResponse.h
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/9/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef NS_ENUM(NSInteger, SKResponseStatusCode) {
    SKResponseStatusCodeUnknown = -1,
    SKResponseStatusCodeAccepted = 202,
    SKResponseStatusCodeCreated = 201,
    SKResponseStatusCodeNotFound = 404,
    SKResponseStatusCodeOK = 200,
    SKResponseStatusCodeBadRequest = 400,
    SKResponseStatusCodeServerError = 500,
    SKResponseStatusCodeUnAuthorized = 401,
    SKResponseStatusCodeValidationFailed = 422
};

@interface SKResponse : NSObject

+ (SKResponse *)responseWithSuccessStatusCode;

+ (SKResponse *)responseWithData:(NSData *)data error:(NSError *)error;

+ (SKResponse *)responseWithData:(NSData *)data error:(NSError *)error requestUrl:(NSURL *)requestUrl;

@property(nonatomic, readonly) NSDictionary *headers;
@property(nonatomic, readonly) NSData *data;
@property(nonatomic, readonly) NSError *error;
@property(nonatomic, readonly) NSURL *requestUrl;
@property(nonatomic, readonly) SKResponseStatusCode statusCode;
@end
