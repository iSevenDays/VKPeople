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
    [imageBrowser setAnimates:YES];
    [imageBrowser setAllowsReordering:NO];
    [SKCore usersSearch].delegate = self;
}

#pragma mark -
#pragma mark SKUsersSearchProtocol

- (void)usersChanged{
    DLog(@"");
    [arrayController addObjects:self.users];
    [arrayController rearrangeObjects];
    [imageBrowser reloadData];
}

#pragma mark -
#pragma mark Zooming
- (void)zoomSliderDidChange:(id)sender{
    /* update the zoom value to scale images */
    [imageBrowser setZoomValue:[sender floatValue]];
    
    /* redisplay */
    [imageBrowser setNeedsDisplay:YES];
}

#pragma mark -
#pragma mark IKImageBrowserDataSource

/* implement image-browser's datasource protocol
 Our datasource representation is a simple mutable array
 */

- (NSUInteger)numberOfItemsInImageBrowser:(IKImageBrowserView *)view{
    /* item count to display is our datasource item count */
    return [self.users count];
}

- (id)imageBrowser:(IKImageBrowserView *)view itemAtIndex:(NSUInteger)index{
    return [self.users objectAtIndex:index];
}

- (BOOL)isSelectable{
    return YES;
}

- (void)magnifyWithEvent:(NSEvent *)event{
    double magnification = [event magnification];
    if( (magnification < 0 && [imageBrowser zoomValue] < 0.12)||(magnification > 0 && [imageBrowser zoomValue] > 1.0) ){
        return;
    }
    
    [imageBrowser setZoomValue:[imageBrowser zoomValue] + magnification];
}

#pragma mark -
#pragma mark NSSplitView allow collapsing
- (CGFloat)splitView:(NSSplitView *)sender
constrainMinCoordinate:(CGFloat)proposedMin ofSubviewAt:(NSInteger)offset{
    return 0;
}

@end
