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

@end
