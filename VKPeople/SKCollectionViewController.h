//
//  SKCollectionViewController.h
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/9/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SKUser.h"
#import "SKUsersSearchProtocol.h"

@protocol SKCollectionViewDataSourceProtocol;

@interface SKCollectionViewController : NSViewController<SKUsersSearchProtocol>{
    IBOutlet NSArrayController *arrayController;
    IBOutlet IKImageBrowserView *imageBrowser;
}

@property (nonatomic, strong) NSArray *users;

- (IBAction)zoomSliderDidChange:(id)sender;

@end
