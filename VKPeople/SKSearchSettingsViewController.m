//
//  SKSearchSetiingsView.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/28/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SKSearchSettingsViewController.h"
#import "SKCore.h"
#import <BlocksKit.h>

@implementation SKSearchSettingsViewController

- (SKSearchSettings *)settings{
    return [SKCore searchSettings];
}

- (void)menuDidClose:(NSMenu *)menu{
    assert([[menu highlightedItem] tag] < 9);
    [self.settings setMaritalStatus:[[menu highlightedItem] tag]];
}

- (void)viewDidLoad{
    if( [autoLoadSearchResults isEnabled]){
        [[SKCore auth] authorizeWithLogin:@"wsevendays@gmail.com" password:@"wSevendays" scopes:@"friends,messages,status,groups,offline" clientID:@"2412525" clientSecret:@"C6HOa36AXUXK4rOzuQ57" successBlock:^(SKResponse *response){
            DLog(@"%@", @"Success!");
            [[SKCore usersSearch] searchWithSuccessBlock:nil errorBlock:nil];
        } errorBlock:^(SKResponse *response) {
            DLog(@"Error: %@", response.error);
        }];
    }
}

@end
