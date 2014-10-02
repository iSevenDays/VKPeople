//
//  SKQuickLookDataSource.h
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/11/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>
#import <QuickLook/QuickLook.h>

@interface SKQuickLookController : NSResponder <QLPreviewPanelDataSource, QLPreviewPanelDelegate> {
    NSMutableArray *pictures;
}
- (instancetype)init __attribute__((unavailable("use initWithIKImageBrowserView:")));

- (instancetype)initWithIKImageBrowserView:(IKImageBrowserView *)imBrowserView andPicturesURLsArray:(NSArray *)picturesURLs;

- (void)setPicturesURLs:(NSArray *)picturesURLs;

@end
