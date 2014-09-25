//
//  SKRespondersView.h
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/25/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// Allows a NSViewController to be automatically added to the responder chain
@interface SKRespondersView : NSView {
    IBOutlet NSViewController *viewController;
}

@end