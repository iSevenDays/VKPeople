//
//  SKAppDelegate.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/27/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SKAppDelegate.h"
#import "SKAuth.h"

@implementation SKAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    // Insert code here to initialize your application
    [[SKAuth sharedInstance] authorizeWithLogin:@"wsevendays@gmail.com" password:@"wSevendays" scopes:@"friends,messages,status,groups,offline" clientID:@"2412525" clientSecret:@"C6HOa36AXUXK4rOzuQ57" SKSuccessBlock:^{
        DLog(@"%@", @"Success!");
    } SKErrorBlock:^(NSError *error) {
        DLog(@"Error: %@", error);
    }];
}

@end
