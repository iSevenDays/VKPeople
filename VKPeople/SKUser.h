//
//  SKUserModel.h
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/27/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "JSONModel.h"

@interface SKUser : JSONModel

@property (nonatomic, assign) NSInteger    UID;
@property (nonatomic, strong) NSString*    firstName;
@property (nonatomic, strong) NSString*    lastName;
@property (nonatomic, strong) NSString<Optional>*    photo400Orig;
@property (nonatomic, strong) NSString*    photoMax;
@property (nonatomic, assign, getter = isOnline) BOOL online;

/// 1 = woman, 2 = man, 0 = undefined
@property (nonatomic, assign) NSInteger    sex;

@property (nonatomic, strong) SKImage<Ignore>*      previewImage;

- (NSString *)domainFull;
- (NSString *)fullName;

@end
