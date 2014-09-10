//
//  SKSearchSettingsObserver.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/8/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SKSearchSettingsObserver.h"
#import "objc/runtime.h"

@implementation SKSearchSettingsObserver

- (id)init{
    self = [super init];
    if( self ){
        [self startObserving];
    }
    return self;
}
- (void)startObserving{
    SKSearchSettings *settings = [SKCore searchSettings];
    
    NSArray *properties = [self settingsProperties];
    
    for( NSString *keyPath in properties ){
        [settings addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSLog(@"%@", keyPath);
    
    if( [self.delegate respondsToSelector:@selector(SKSearchSettingsObserver:settingsChangedFrom:to:)] ){
        [self.delegate SKSearchSettingsObserver:self settingsChangedFrom:keyPath to:[change valueForKey:@"new"]];
    }
}

- (void)stopObserving{
    SKSearchSettings *settings = [SKCore searchSettings];
    
    NSArray *properties = [self settingsProperties];
    
    for( NSString *keyPath in properties ){
        [settings removeObserver:self forKeyPath:keyPath];
    }
}

- (void)dealloc{
    [self stopObserving];
}

- (NSArray *)settingsProperties{
    NSMutableArray *array = [NSMutableArray array];
    
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([SKSearchSettings class], &count);
    
    for( size_t i = 0; i < count; i++){
        NSString *keyPath = [NSString stringWithUTF8String:property_getName(properties[i])];
        [array addObject:keyPath];
    }
    free(properties);
    return [array copy];
}


@end
