//
//  SKCollectionViewController.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/9/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SKCollectionViewController.h"

@interface SKCollectionViewController ()

@end

@implementation SKCollectionViewController
{
}

- (SKSearchSettings *)settings{
    return [SKCore searchSettings];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    SKUser *user = [[SKUser alloc] init];
    user.firstName = @"ahha";
    user.lastName = @"last";
    user.photoMax = @"photo max";
    _users = [NSMutableArray array];
    [arrayController addObject:user];
    
    
    NSLog(@"%@", self.view);
}

@end
