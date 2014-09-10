//
//  SKCollectionViewController.h
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/9/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SKUser.h"


@interface SKCollectionViewController : NSViewController<SKUsersSearchProtocol>{
    IBOutlet NSArrayController *arrayController;
}

@property (nonatomic, strong) NSArray *users;

@end
