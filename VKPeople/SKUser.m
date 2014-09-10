//
//  SKUserModel.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/27/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SKUser.h"

@implementation SKUser

- (NSString *)domainFull{
    return [NSString stringWithFormat:@"vk.com/%ld", (long)self.UID];
}

+ (JSONKeyMapper *)keyMapper{
    JSONKeyMapper *keyMapper =[JSONKeyMapper mapperFromUnderscoreCaseToCamelCase];
   //TODO: [keyMapper setValue:@"uid" forKey:@"UID"];
    [keyMapper.toJSONMap setValue:@"uid" forKey:@"UID"];
    [keyMapper.toModelMap setValue:@"UID" forKey:@"uid"];
    return keyMapper;
}
@end
