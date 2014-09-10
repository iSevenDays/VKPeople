//
//  SKAppDelegate.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/27/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SKAppDelegate.h"

@implementation SKAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [SKCore forceLoad];
    // Insert code here to initialize your application
//    [[SKCore auth] authorizeWithLogin:@"wsevendays@gmail.com" password:@"wSevendays" scopes:@"friends,messages,status,groups,offline" clientID:@"2412525" clientSecret:@"C6HOa36AXUXK4rOzuQ57" successBlock:^(SKResponse *response){
//        DLog(@"%@", @"Success!");
//        [[SKCore usersSearch] searchWithSuccessBlock:^(SKResponse *response){
//            
//        } errorBlock:^(SKResponse *resonse) {
//            
//        }];
//    } errorBlock:^(SKResponse *response) {
//        DLog(@"Error: %@", response.error);
//    }];
}

@end
