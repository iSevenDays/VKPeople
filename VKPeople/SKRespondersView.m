//
//  SKRespondersView.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/25/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SKRespondersView.h"

@implementation SKRespondersView

- (void)setViewController:(NSViewController *)newController {
    if( viewController ){
        NSResponder *controllerNextResponder = [viewController nextResponder];
        [super setNextResponder:controllerNextResponder];
        [viewController setNextResponder:nil];
    }

    viewController = newController;

    if( newController ){
        NSResponder *ownNextResponder = [self nextResponder];
        [super setNextResponder:viewController];
        [viewController setNextResponder:ownNextResponder];
    }
}

- (void)setNextResponder:(NSResponder *)newNextResponder {
    if( viewController ){
        [viewController setNextResponder:newNextResponder];
        return;
    }

    [super setNextResponder:newNextResponder];
}
@end