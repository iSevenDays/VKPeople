//
//  PlatformAdapter.h
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/27/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#ifndef VKPeople_PlatformAdapter_h
#define VKPeople_PlatformAdapter_h

#if TARGET_OS_IPHONE

#define SKColor UIColor
#define SKImage UIImage
#define SKFont UIFont
#define SKBezierPath UIBezierPath

#elif TARGET_OS_MAC && !TARGET_OS_IPHONE

#define SKColor NSColor
#define SKImage NSImage
#define SKFont NSFont
#define SKBezierPath NSBezierPath

#endif

#endif
