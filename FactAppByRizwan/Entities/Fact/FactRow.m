//
//  FactRow.m
//  FactAppByRizwan
//
//  Created by Rizwan on 4/27/18.
//  Copyright © 2018 Fact. All rights reserved.
//

#import "FactRow.h"

@implementation FactRow

-(FactRow *)initWithDetails:(NSDictionary *)detailsDict
{
    
    if ([self isAnyDataAvailable:detailsDict]) {
        NSString *title = [self setNilIfNullString:detailsDict[@"title"]];
        NSString *description = [self setNilIfNullString:detailsDict[@"description"]];
        NSString *imageURL = [self setNilIfNullString:detailsDict[@"imageHref"]];
        self.title = title;
        self.descriptionDetails = description;
        self.imageURL = imageURL;
        return self;
    }
    return nil;
}

-(BOOL)isAnyDataAvailable:(NSDictionary *)detailsDict
{
    NSString *title = [self setNilIfNullString:detailsDict[@"title"]];
    NSString *description = [self setNilIfNullString:detailsDict[@"description"]];
    NSString *imageURL = [self setNilIfNullString:detailsDict[@"imageHref"]];
    if (title || description || imageURL) {
        return YES;
    }
    return NO;
}
-(id)setNilIfNullString:(NSString *)stringValue
{
    if (stringValue == nil || stringValue == (id)[NSNull null] || [stringValue isKindOfClass:[NSNull class]]) {
        return nil;
        
    }
    return stringValue;
}

@end

