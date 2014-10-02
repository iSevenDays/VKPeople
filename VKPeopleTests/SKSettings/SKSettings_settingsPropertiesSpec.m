//
//  SKSettings_settingsPropertiesSpec.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/9/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//
#import "Kiwi.h"
#import "objc/runtime.h"

SPEC_BEGIN(SKSettings_settingsPropertiesSpec)

    describe(@"Settings module", ^{
        it(@"properties should math their names", ^{
            unsigned int count;
            objc_property_t *properties = class_copyPropertyList([SKSearchSettings class], &count);
            for( size_t i = 0; i < count; ++i ){
                NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
                [[(key) should] beNonNil];
            }
            free(properties);
        });

    });

SPEC_END