//
//  SKSearchSettingsObserver.h
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/8/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol SKSearchSettingsObserverProtocol;

@interface SKSearchSettingsObserver : NSObject

@property (nonatomic, weak) id<SKSearchSettingsObserverProtocol> delegate;

@end


@protocol SKSearchSettingsObserverProtocol <NSObject>

- (void)SKSearchSettingsObserver:(SKSearchSettingsObserver *)observer settingsChangedFrom:(NSString *)keyPath to:(NSString *)value;

@end