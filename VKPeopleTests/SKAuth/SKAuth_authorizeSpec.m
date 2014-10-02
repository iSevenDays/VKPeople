//
//  NSObject+SKAuth_authorize.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/9/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//
#import "Kiwi.h"
#import "OHHTTPStubs.h"

SPEC_BEGIN(SKAuth_authorizeSpec)

    describe(@"Auth module", ^{
        context(@"should correctly perform authorization", ^{

            __block NSString *requestURL;
            __block NSString *requestMethod;
            __block NSData *requestData;

            beforeEach(^{
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return YES;
                }                   withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                    requestURL = request.URL.absoluteString;
                    requestMethod = [request HTTPMethod];
                    requestData = request.HTTPBody;
                    return [OHHTTPStubsResponse responseWithFileAtPath:OHPathForFileInBundle(@"auth_response.json", nil) statusCode:200 headers:nil];
                }];
            });

            afterAll(^{
                [OHHTTPStubs removeAllStubs];
            });

            it(@"should have correct URL", ^{
                NSString *clientID = @"345";
                NSString *clientSecret = @"secretKEY";
                NSString *login = @"myLogin";
                NSString *password = @"myPassword";
                NSString *scopes = @"friends,messages,status,groups,offline";

                NSString *vkApiURL = [NSString stringWithFormat:@"https://oauth.vk.com/token?grant_type=password&client_id=%@&client_secret=%@&username=%@&password=%@&v=5.24", clientID, clientSecret, login, password];

                SKAuth *auth = [SKCore auth];
                [auth authorizeWithLogin:login password:password scopes:scopes clientID:clientID clientSecret:clientSecret successBlock:nil errorBlock:nil];

                [[expectFutureValue(requestURL) shouldEventually] equal:vkApiURL];
            });

            it(@"and return correct access token", ^{

                __block NSString *responseAccessToken = nil;
                NSString *accessToken = @"28878c509d66ec33cb3ebcac349c97a75b67c57245a7ba8b2c610709ed05a00de1bebeb53356ac678cd77";
                __block SKResponse *requestResponse;
                SKAuth *auth = [SKCore auth];
                [auth authorizeWithLogin:nil password:nil scopes:nil clientID:nil clientSecret:nil successBlock:^(SKResponse *response) {
                    responseAccessToken = [auth accessToken];
                    requestResponse = response;

                }             errorBlock:^(SKResponse *response) {
                    requestResponse = response;
                }];
                NSLog(@"%@", requestResponse.error);
                [[expectFutureValue(requestResponse) shouldEventually] beNonNil];
                [[expectFutureValue(requestResponse.error) shouldEventually] beNil];
                [[expectFutureValue(responseAccessToken) shouldEventually] beNonNil];
                [[expectFutureValue(responseAccessToken) shouldEventually] equal:accessToken];
            });
        });
    });

SPEC_END