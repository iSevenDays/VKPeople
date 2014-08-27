//
//  SKAuth.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/27/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SKAuth.h"
#import <SBJson4Parser.h>
@implementation SKAuth
{
    SKSuccessBlock successBlock;
    SKErrorBlock errorBlock;
}
+ (instancetype)sharedInstance{
    __block id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)authorizeWithLogin:(NSString *)login password:(NSString *)password scopes:(NSString *)scopes clientID:(NSString *)clientID clientSecret:(NSString *)clientSecret SKSuccessBlock:(SKSuccessBlock)skSuccessBlock SKErrorBlock:(SKErrorBlock)skErrorBlock {
    successBlock = skSuccessBlock;
    errorBlock = skErrorBlock;
    
    NSString *stringURL = [NSString stringWithFormat:@"https://oauth.vk.com/token?grant_type=password&client_id=%@&client_secret=%@&username=%@&password=%@&v=5.24", clientID, clientSecret, login, password];;
    NSURL  *url = [NSURL URLWithString:stringURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval: 10.0]; // Will timeout after 10 seconds
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
       
        if( data != nil && error == nil ){
            id parser = [SBJson4Parser parserWithBlock:^(id item, BOOL *stop) {
                _access_token = [item valueForKey:@"access_token"];
                successBlock();
            } allowMultiRoot:NO unwrapRootArray:YES errorHandler:^(NSError *error) {
                if( errorBlock != nil){
                    errorBlock(error);
                    errorBlock = nil;
                }
            }];
            [parser parse:data];
        }
        else if( errorBlock != nil){
            errorBlock(error);
            errorBlock = nil;
        }
    }];
}

@end
