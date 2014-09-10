//
//  SKSearchSettingsModel.h
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/28/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MaritalStatus){
    SINGLE  = 1,
    HAVE_SOMEONE = 2,// есть друг/есть подруга;
    BETROTHED = 3, // помолвлен/помолвлена;
    MARRIED = 4,
    COMPLICATED = 5,
    ACTIVELY_SEARCHING = 6,
    IN_LOVE = 7,
    UNDEFINED = 8
};

@interface SKSearchSettings : NSObject

@property (nonatomic, strong) NSString*     country;
@property (nonatomic, strong) NSString*     city;
@property (nonatomic, assign) NSUInteger    ageFrom;
@property (nonatomic, assign) NSUInteger    ageTo;
@property (nonatomic, assign, getter = isOnline) BOOL online;
@property (nonatomic, assign) MaritalStatus maritalStatus;

@end
