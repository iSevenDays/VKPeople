//
//  SKSearcPeople.h
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/27/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SKUsersSearchProtocol;

@interface SKUsersSearch : NSObject <SKSearchSettingsObserverProtocol>

- (void)reset;
- (void)searchWithSuccessBlock:(SKSuccessBlock)successBlock errorBlock:(SKErrorBlock)errorBlock;

/// contains SKUser instances
@property (nonatomic, strong) NSArray*      users;
@property (nonatomic, assign) NSUInteger    offset;
@property (nonatomic, assign) NSUInteger    countPerRequest;
@property (nonatomic, weak)   id<SKUsersSearchProtocol> delegate;

@end