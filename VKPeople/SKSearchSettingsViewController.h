//
//  SKSearchSetiingsView.h
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/28/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SKCore.h"

@protocol SKSearchSettingsProtocol;
@interface SKSearchSettingsViewController : NSViewController{
    IBOutlet NSButton *autoLoadSearchResults;
}

@property(nonatomic, assign) SKSearchSettings* settings;
@property(nonatomic, weak) id<SKSearchSettingsProtocol> delegate;

@end


@protocol SKSearchSettingsProtocol <NSObject>

- (void)settingsUpdated;

@end