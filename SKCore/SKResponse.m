//
//  SKResponse.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/9/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SKResponse.h"

@interface SKResponse()
@property (nonatomic, readwrite) NSURL *requestUrl;
@property (nonatomic, readwrite) SKResponseStatusCode statusCode;
@end

@implementation SKResponse

+ (SKResponse *)responseWithSuccessStatusCode{
    SKResponse *resp = [[SKResponse alloc] init];
    resp.statusCode = SKResponseStatusCodeOK;
    return resp;
}

+ (SKResponse *)responseWithData:(NSData *)data error:(NSError *)error{
    return [[SKResponse alloc] initWithData:data error:error];
}

- (instancetype)initWithData:(NSData *)data error:(NSError *)error {
    self = [super init];
    if (self) {
        _data = data;
        _headers = nil;
        _statusCode = SKResponseStatusCodeUnknown;
    }
    return self;
}

+ (SKResponse *)responseWithData:(NSData *)data error:(NSError *)error requestUrl:(NSURL *)requestUrl{
    SKResponse *resp = [SKResponse responseWithData:data error:error];
    resp.requestUrl = requestUrl;
    return resp;
}

@end
