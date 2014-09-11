//
//  SKCollectionViewController.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/9/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SKCollectionViewController.h"


@implementation SKCollectionViewController
{
}

- (SKSearchSettings *)settings{
    return [SKCore searchSettings];
}

- (NSArray *)users{
    return [[SKCore usersSearch] users];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [SKCore usersSearch].delegate = self;
}

#pragma mark -
#pragma mark SKUsersSearchProtocol

- (void)usersChanged{
    DLog(@"");
    [arrayController addObjects:self.users];
    [arrayController rearrangeObjects];
}
@end
