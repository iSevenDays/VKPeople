//
//  SKCore.h
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/28/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SKAuth.h"
#import "SKSearchSettings.h"
#import "SKUser.h"
#import "SKSearchSettingsObserver.h"
#import "SKUsersSearch.h"

@interface SKCore : NSObject

+ (void)forceLoad;

+ (SKAuth *)auth;
+ (SKUsersSearch *)usersSearch;
+ (SKSearchSettings *)searchSettings;
+ (SKSearchSettingsObserver *)searchSettingsObserver;


@end
