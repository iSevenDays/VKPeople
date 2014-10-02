//
//  SKUserModel.m
//  VKPeople
//
//  Created by Anton Sokolchenko on 8/27/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

@implementation SKUser

- (NSString *)domainFull {
    return [NSString stringWithFormat:@"vk.com/%ld", (long) self.UID];
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

+ (JSONKeyMapper *)keyMapper {
    JSONKeyMapper *keyMapper = [JSONKeyMapper mapperFromUnderscoreCaseToCamelCase];
    //TODO: [keyMapper setValue:@"uid" forKey:@"UID"];
    [keyMapper.toJSONMap setValue:@"uid" forKey:@"UID"];
    [keyMapper.toModelMap setValue:@"UID" forKey:@"uid"];
    return keyMapper;
}

/* required methods of the IKImageBrowserItem protocol */
#pragma mark -
#pragma mark item data source protocol

/* let the image browser knows we use a path representation */
- (NSString *)imageRepresentationType {
    return IKImageBrowserNSDataRepresentationType;
}

/* give our representation to the image browser */
- (id)imageRepresentation {
    return self.previewImageData;
}

/* use the absolute filepath as identifier */
- (NSString *)imageUID {
    return [@(self.UID) stringValue];
}

@end
