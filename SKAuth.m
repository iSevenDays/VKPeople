//
//  SKAuth.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/27/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <SBJson4Parser.h>

@implementation SKAuth {
    SKSuccessBlock successBlock;
    SKErrorBlock errorBlock;
}

- (NSURLRequest *)authorizeWithLogin:(NSString *)login password:(NSString *)password scopes:(NSString *)scopes clientID:(NSString *)clientID clientSecret:(NSString *)clientSecret successBlock:(SKSuccessBlock)_successBlock errorBlock:(SKErrorBlock)_errorBlock {
    successBlock = _successBlock;
    errorBlock = _errorBlock;

    NSString *stringURL = [NSString stringWithFormat:@"https://oauth.vk.com/token?grant_type=password&client_id=%@&client_secret=%@&username=%@&password=%@&v=5.24", clientID, clientSecret, login, password];
    NSURL *url = [NSURL URLWithString:stringURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:10.0]; // Will timeout after 10 seconds
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {

        if( data != nil && error == nil ){
            id parser = [SBJson4Parser parserWithBlock:^(id item, BOOL *stop) {
                _accessToken = [item valueForKey:@"access_token"];
                if( successBlock != nil ){
                    successBlock([SKResponse responseWithData:data error:nil]);
                }
            }                           allowMultiRoot:NO unwrapRootArray:YES errorHandler:^(NSError *error) {
                if( errorBlock != nil ){
                    errorBlock([SKResponse responseWithData:data error:error]);
                    errorBlock = nil;
                }
            }];

            [parser parse:data];
        }
        else if( errorBlock != nil ){
            errorBlock([SKResponse responseWithData:data error:error]);
            errorBlock = nil;
        }
    }];

    return [request copy];
}

@end
