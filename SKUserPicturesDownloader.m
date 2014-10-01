//
//  SKUserPicturesDownloader.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/11/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SKUserPicturesDownloader.h"
#import "SKRequest.h"

@implementation SKUserPicturesDownloader

+ (void)downloadAvatarsWithUserID:(NSString *)userID successBlock:(void(^)(SKResponse *response, NSArray *userPicturesURLs))successBlock errorBlock:(SKErrorBlock)errorBlock{
    NSDictionary *params = @{@"owner_id": userID,
                             @"count": @50,
                             @"rev": @1};
    
    [SKRequest requestDataFromVkMethod:@"photos.getProfile" params:params successBlock:^(SKResponse *response, NSArray *objects) {
        NSMutableArray *picturesURLs = [NSMutableArray array];
        for(NSDictionary *dict in objects){
            if( dict[@"src_xxxbig"] !=nil &&  dict[@"src_xxxbig"] != [NSNull null] ){
                [picturesURLs addObject:dict[@"src_xxxbig"]];
            }
            else if ( dict[@"src_xxbig"] !=nil &&  dict[@"src_xxbig"] != [NSNull null]  ){
                [picturesURLs addObject:dict[@"src_xxbig"]];
            }
            else if ( dict[@"src_xbig"] !=nil &&  dict[@"src_xbig"] != [NSNull null]  ){
                [picturesURLs addObject:dict[@"src_xbig"]];
            }
        }
        successBlock([SKResponse responseWithSuccessStatusCode], picturesURLs);
    } errorBlock:^(SKResponse *response) {
        
    }];
}

@end
