//
//  SKFileFieldFormatter.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/28/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SKFileFieldFormatter.h"

@implementation SKFileFieldFormatter

- (NSNumberFormatterBehavior)formatterBehavior {
    return NSNumberFormatterBehavior10_4;
}

- (NSNumberFormatterStyle)numberStyle {
    return NSNumberFormatterDecimalStyle;
}


@end
