//
//  NSResponder+FirstResponder.h.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/25/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

static __weak id currentFirstResponder;

@implementation NSResponder (FirstResponder)
+ (id)currentFirstResponder {
    currentFirstResponder = nil;
    [[NSApplication sharedApplication] sendAction:@selector(findFirstResponder:) to:nil from:nil];
    return currentFirstResponder;
}

- (void)findFirstResponder:(id)sender {
    currentFirstResponder = self;
}
@end