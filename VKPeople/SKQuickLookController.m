//
//  SKQuickLookDataSource.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 9/11/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SKQuickLookController.h"

@implementation SKQuickLookController {
    IKImageBrowserView *_imBrowserView;
    QLPreviewPanel *_panel;
}

- (instancetype)initWithIKImageBrowserView:(IKImageBrowserView *)imBrowserView andPicturesURLsArray:(NSArray *)picturesURLs {
    self = [super init];
    if( self ){
        pictures = [picturesURLs mutableCopy];
        _imBrowserView = imBrowserView;
    }
    return self;
}

- (BOOL)acceptsPreviewPanelControl:(QLPreviewPanel *)panel {
    return YES;
}

- (void)beginPreviewPanelControl:(QLPreviewPanel *)panel {
    // This document is now responsible of the preview panel
    // It is allowed to set the delegate, data source and refresh panel.
    //_panel = panel;
    panel.delegate = self;
    panel.dataSource = self;

    NSLog(@"We can now receive QL Events.");
}

- (void)endPreviewPanelControl:(QLPreviewPanel *)panel {
    // This document loses its responsisibility on the preview panel
    // Until the next call to -beginPreviewPanelControl: it must not
    // change the panel's delegate, data source or refresh it.
    [self resignFirstResponder];
    //_panel.delegate = nil;
    // _panel.dataSource = nil;
    //_panel = nil;

    NSLog(@"endPreviewPanelControl");
    // AntiARCRelease(self);
}

- (void)setPicturesURLs:(NSArray *)picturesURLs {
    [pictures removeAllObjects];
    pictures = [NSMutableArray arrayWithArray:picturesURLs];
}

- (id <QLPreviewItem>)previewPanel:(QLPreviewPanel *)panel previewItemAtIndex:(NSInteger)index {
    return [NSURL URLWithString:[pictures objectAtIndex:index]];
}

- (NSRect)previewPanel:(QLPreviewPanel *)panel sourceFrameOnScreenForPreviewItem:(id <QLPreviewItem>)item {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [_imBrowserView convertRectToBase:[_imBrowserView visibleRect]];
#pragma clang diagnostic pop
}

- (NSInteger)numberOfPreviewItemsInPreviewPanel:(QLPreviewPanel *)panel {
    return pictures.count;
}

@end
