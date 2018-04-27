//
//  Fact.m
//  FactAppByRizwan
//
//  Created by Rizwan on 4/27/18.
//  Copyright © 2018 Fact. All rights reserved.
//

#import "Fact.h"
#import "FactRow.h"

@implementation Fact
-(Fact *)initWithDetails:(NSDictionary *)detailsDict;
{
    NSString *title = detailsDict[@"title"];
    self.title = title;
    self.rows = [[NSMutableArray alloc] init];
    NSArray *rowsArray = detailsDict[@"rows"];
    for (NSDictionary *factRosDetailsDict in rowsArray ) {
        FactRow *factRow = [[FactRow alloc] initWithDetails:factRosDetailsDict];
        if (factRow) {
            [self.rows addObject:factRow];
        }
    }
    return  self;
}
@end
