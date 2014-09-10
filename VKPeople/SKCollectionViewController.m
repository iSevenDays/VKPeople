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

- (NSArray *)users{
    return [[SKCore usersSearch] users];
}

- (SKSearchSettings *)settings{
    return [SKCore searchSettings];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.view);

}

@end
