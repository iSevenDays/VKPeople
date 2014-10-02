//
//  SKCore.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/28/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

@implementation SKCore

+ (void)forceLoad {
    [self auth];
    [self usersSearch];
    [self searchSettings];
    [self searchSettingsObserver];
}

+ (SKAuth *)auth {
    static SKAuth *auth = nil;
    if( auth == nil ){
        auth = [[SKAuth alloc] init];
    }
    return auth;
}

+ (SKUsersSearch *)usersSearch {
    static SKUsersSearch *usersSearch = nil;
    if( usersSearch == nil ){
        usersSearch = [[SKUsersSearch alloc] init];
        [usersSearch reset];
    }
    return usersSearch;
}

+ (SKSearchSettings *)searchSettings {
    static SKSearchSettings *searchSettings = nil;
    if( searchSettings == nil ){
        searchSettings = [[SKSearchSettings alloc] init];
    }
    return searchSettings;
}

+ (SKSearchSettingsObserver *)searchSettingsObserver {
    static SKSearchSettingsObserver *searchSettingsObserver = nil;
    if( searchSettingsObserver == nil ){
        searchSettingsObserver = [[SKSearchSettingsObserver alloc] init];
    }
    return searchSettingsObserver;
}

@end
