//
//  SKRequest.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/28/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <SBJson4Parser.h>

@implementation SKRequest

+ (void)requestDataByURL:(NSString *)url successBlock:(void (^)(SKResponse *, NSArray *))successBlock errorBlock:(SKErrorBlock)errorBlock {
}

+ (void)requestDataFromVkMethod:(NSString *)method params:(NSDictionary *)params successBlock:(void (^)(SKResponse *, NSArray *))successBlock errorBlock:(SKErrorBlock)errorBlock {

    NSString *stringURL = [NSString stringWithFormat:@"https://api.vk.com/method/%@?access_token=%@&%@", method, [[SKCore auth] accessToken], [params getAsQueryParams]];
    DLog(@"%@", stringURL);

    NSURL *url = [NSURL URLWithString:stringURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    [request setTimeoutInterval:10.0]; // Will timeout after 10 seconds

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if( data != nil && error == nil ){
            id parser = [SBJson4Parser parserWithBlock:^(id item, BOOL *stop) {
                NSMutableArray *result = [item objectForKey:@"response"];

                if( [method isEqualToString:@"users.search"] ){
                    [result removeObjectAtIndex:0];
                }
                successBlock([SKResponse responseWithData:data error:error requestUrl:url], result);

            }                           allowMultiRoot:NO unwrapRootArray:NO errorHandler:^(NSError *error) {
                if( errorBlock != nil ){
                    errorBlock([SKResponse responseWithData:data error:error]);
                }
            }];
            [parser parse:data];
        }
        else if( errorBlock != nil ){
            errorBlock([SKResponse responseWithData:data error:error]);
        }
    }];
}

@end
