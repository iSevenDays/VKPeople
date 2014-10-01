//
//  SKUserPicturesDownloader.h
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/11/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SKUserPicturesDownloader : NSResponder

+ (void)downloadAvatarsWithUserID:(NSString *)userID successBlock:(void(^)(SKResponse *response, NSArray *userPicturesURLs))successBlock errorBlock:(SKErrorBlock)errorBlock;

@end
