//
//  SKSearcPeople.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/27/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SKUsersSearch.h"
#import "SKUsersSearchProtocol.h"

@implementation SKUsersSearch
{
    NSMutableArray *countries;
    NSMutableArray *cities;
}
- (instancetype)init{
    self = [super init];
    if( self ){
        [self loadCounties];
        [self loadRegions];
        [SKCore searchSettingsObserver].delegate = self;
    }
    return self;
}

- (void)searchWithSuccessBlock:(SKSuccessBlock)successBlock errorBlock:(SKErrorBlock)errorBlock{
    NSDictionary *params = @{@"offset":@(self.offset),
                             @"count":@(self.countPerRequest),
                             @"fields": @"sex,online,photo_400_orig,photo_max",
                             @"city": [cities objectAtIndex:0],
                             @"country": [countries objectAtIndex:0],
                             };
    
    [SKRequest requestDataFromVkMethod:@"users.search" params:params successBlock:^(SKResponse *response, NSArray *responseData) {
        NSMutableArray *users = [NSMutableArray arrayWithCapacity:responseData.count];
        NSError *error;
        
        for( NSDictionary *dic in responseData ){
            SKUser *vkUser = [[SKUser alloc] initWithDictionary:dic error:&error];
            if( vkUser != nil ){
                
                dispatch_async(dispatch_queue_create("aaa", NULL), ^{
                    NSString *imageToLoad = vkUser.photo400Orig != nil? vkUser.photo400Orig :vkUser.photoMax;
                    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageToLoad]];
                    
                    vkUser.previewImageData = imageData;
                });
                
                [users addObject:vkUser];
            }
            else{
                NSLog(@"%@", error);
            }
        }
        
        self.users = [users copy];
        if( [self.delegate respondsToSelector:@selector(usersChanged)] ){
            [self.delegate usersChanged];
        }
    } errorBlock:^(SKResponse *response) {
        DLog(@"%@", response.error);
    }];
}

- (void)reset{
    self.countPerRequest = 100;
    self.offset = 0;
    self.users = [NSArray array];
}

- (void)loadCounties{
    if( countries == nil ){
        countries = [NSMutableArray array];
        [countries addObject:@2];
    }
}

- (void)loadRegions{
    if( cities == nil ){
        cities = [NSMutableArray array];
        [cities addObject:@280];
    }
}

#pragma mark -
#pragma mark SKSearchSettingsObserver delegate
- (void)SKSearchSettingsObserver:(SKSearchSettingsObserver *)observer settingsChangedFrom:(NSString *)keyPath to:(NSString *)value{
    
}

@end
